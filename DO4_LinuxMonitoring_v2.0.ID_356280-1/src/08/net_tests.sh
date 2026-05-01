#!/usr/bin/bash

set -euo pipefail
CMD="${1:-}"
shift || true

die(){ echo "ERROR: $*" >&2; exit 2; }

validate_ip(){
  [[ "$1" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] || die "Invalid IP: $1"
}

install_deps(){
  [ "$(id -u)" -eq 0 ] || die "install-deps requires sudo"
  apt update -y
  apt install -y curl iperf3 jq bc
  apt install -y stress-ng || apt install -y stress || true
  echo "Deps installed (curl iperf3 jq bc stress-ng/stress)"
}

iperf_server(){
  command -v iperf3 >/dev/null 2>&1 || die "iperf3 not installed"
  if pgrep -x iperf3 >/dev/null 2>&1; then
    echo "iperf3 server already running"
    return
  fi
  nohup iperf3 -s >/var/log/iperf3-server.log 2>&1 &
  sleep 1
  pgrep -x iperf3 >/dev/null 2>&1 || die "Failed to start iperf3"
  echo "iperf3 server started (logs: /var/log/iperf3-server.log)"
}

iperf_client(){
  local srv="$1"; local t="${2:-10}"
  validate_ip "$srv"
  command -v iperf3 >/dev/null 2>&1 || die "iperf3 not installed"
  echo "Running iperf3 -> $srv for ${t}s"
  iperf3 -c "$srv" -t "$t"
}

check_interface(){
  local iface="$1"; local interval="$2"; local samples="${3:-5}"
  [ -d "/sys/class/net/$iface" ] || die "Interface not found: $iface"
  [[ "$interval" =~ ^[0-9]+$ ]] || die "interval must be integer"
  [[ "$samples" =~ ^[0-9]+$ ]] || die "samples must be integer"
  echo "Monitoring $iface every ${interval}s for ${samples} samples"
  for ((i=1;i<=samples;i++)); do
    rx1=$(cat /sys/class/net/"$iface"/statistics/rx_bytes)
    tx1=$(cat /sys/class/net/"$iface"/statistics/tx_bytes)
    sleep "$interval"
    rx2=$(cat /sys/class/net/"$iface"/statistics/rx_bytes)
    tx2=$(cat /sys/class/net/"$iface"/statistics/tx_bytes)
    rx_mbps=$(awk -v a="$rx1" -v b="$rx2" -v t="$interval" 'BEGIN{printf "%.2f", (b-a)/t/1024/1024*8}')
    tx_mbps=$(awk -v a="$tx1" -v b="$tx2" -v t="$interval" 'BEGIN{printf "%.2f", (b-a)/t/1024/1024*8}')
    echo "sample $i: RX ${rx_mbps} Mbps | TX ${tx_mbps} Mbps"
  done
}

case "$CMD" in
  install-deps)
    install_deps
    ;;
  iperf-server)
    iperf_server
    ;;
  iperf-client)
    [ -n "${1:-}" ] || die "iperf-client <server_ip> [time]"
    iperf_client "$@"
    ;;
  check-interface)
    [ -n "${1:-}" ] || die "check-interface <iface> <interval> [samples]"
    check_interface "$@"
    ;;
  *)
    die "Unknown subcommand: $CMD"
    ;;
esac
