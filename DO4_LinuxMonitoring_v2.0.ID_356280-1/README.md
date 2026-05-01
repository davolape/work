# DO4 — Linux Monitoring v2.0

> School 21 DevOps Track · 2024

Extended Bash monitoring — log file generation, analysis, cleanup, HTML reports, and a full Prometheus + Grafana stack setup.

---

## What Was Done

**Part 1 — File & log generation**
- Script generates files with random names, extensions, and sizes
- Checks available disk space before creating files

**Part 2 — File system analysis**
- Generates Apache-style log files (`part2.log`)
- Analyzes logs: counts requests, errors, top IPs

**Part 3 — Log cleanup**
- Scripts to clean logs by date, mask, or time period

**Part 4 — Log file generation**
- Generates multiple log files (`vajniy_log_*.log`) with configurable parameters

**Part 5 — Display modes**
- 4 output modes: sorted by name, size, date — configurable via `config.sh`

**Part 6 — HTML report**
- Generates an HTML report from system/log data

**Part 7 — Prometheus + Grafana**
- Installs and configures Prometheus, Node Exporter, and Grafana
- Verifies metrics are visible in Grafana dashboard

**Part 8 — Custom Grafana dashboard**
- Downloads and imports a custom dashboard (JSON)
- Runs network tests and verifies metrics appear in Grafana

## Project Structure

```
src/
├── 01/   # File generator + space check
├── 02/   # Log generator + analyzer
├── 03/   # Log cleanup scripts
├── 04/   # Multi-log generator
├── 05/   # Display modes
├── 06/   # HTML report
├── 07/   # Prometheus + Grafana setup
└── 08/   # Custom dashboard import
```

## Tools Used

`bash` · `awk` · `sed` · `Prometheus` · `Node Exporter` · `Grafana`
