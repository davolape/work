#!/usr/bin/bash

set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"

die(){ echo "ERROR: $*" >&2; exit 1; }

case "${1:-}" in
  install-deps)
    exec "$DIR/net_tests.sh" install-deps
    ;;
  download)
    [ -n "${2:-}" ] || die "Usage: $0 download <grafana_dashboard_id>"
    exec "$DIR/download_dashboard.sh" "$2"
    ;;
  iperf-server)
    exec "$DIR/net_tests.sh" iperf-server
    ;;
  iperf-client)
    [ -n "${2:-}" ] || die "Usage: $0 iperf-client <server_ip> [time_s]"
    exec "$DIR/net_tests.sh" iperf-client "$2" "${3:-10}"
    ;;
  check-interface)
    [ -n "${2:-}" ] || die "Usage: $0 check-interface <iface> <interval_s> [samples]"
    exec "$DIR/net_tests.sh" check-interface "$2" "$3" "${4:-5}"
    ;;
  *)
    cat <<EOF
Usage: $0 <command> [args]
Commands:
  install-deps
  download <grafana_dashboard_id>
  iperf-server
  iperf-client <server_ip> [time_s]
  check-interface <iface> <interval_s> [samples]
EOF
    exit 1
    ;;
esac
