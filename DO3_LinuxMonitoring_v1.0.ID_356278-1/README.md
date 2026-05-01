# DO3 — Linux Monitoring v1.0

> School 21 DevOps Track · 2024

A set of Bash scripts that collect and display system information — from basic output to colorized, configurable dashboards.

---

## What Was Done

**Part 1 — Input validation**
- Script that checks arguments before running

**Part 2 — System info output**
- Collects and prints: hostname, timezone, user, OS, date, uptime, IP, mask, gateway, RAM, disk usage

**Part 3 — Colored output**
- Same system info but with configurable foreground/background colors passed as arguments (1–6)
- Uses ANSI escape codes for terminal coloring

**Part 4 — Config file support**
- Reads color settings from `config.cfg` instead of arguments
- Falls back to defaults if config is missing or invalid

**Part 5 — Time benchmarking**
- Measures and logs script execution time

## Project Structure

```
src/
├── 01/   # Input validation
├── 02/   # System info (plain)
├── 03/   # System info (colored, args)
├── 04/   # System info (colored, config)
└── 05/   # Execution time benchmark
```

## Tools Used

`bash` · `hostname` · `timedatectl` · `ip` · `free` · `df` · `awk` · `ANSI colors`
