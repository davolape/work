# DO2 — Linux Network

> School 21 DevOps Track · 2024

Hands-on Linux network configuration across multiple virtual machines — subnetting, static routing, firewalls, DHCP, NAT, and SSH tunnels.

---

## What Was Done

- Calculated subnets, masks, and host ranges using `ipcalc`
- Configured static IPs on two VMs (`ws1`, `ws2`) via netplan
- Added static routes between machines and verified connectivity with `ping`
- Measured network throughput between VMs using `iperf3`
- Wrote and applied `iptables` firewall rules (`/etc/firewall.sh`):
  - Tested "deny-then-allow" vs "allow-then-deny" rule ordering
  - Used `nmap` to confirm a host is up even when it doesn't respond to ping
- Configured a 5-machine network (3 workstations + 2 routers) with netplan
- Set up NAT and SSH tunnels (local and remote port forwarding)

## Key Concepts

- iptables rule ordering: first match wins
- Difference between public and private IP ranges
- Static vs DHCP addressing
- How NAT works at the router level

## Tools Used

`ipcalc` · `netplan` · `iperf3` · `iptables` · `nmap` · `ssh`

## Environment

Ubuntu 20.04 LTS Server · VirtualBox · 5 VMs
