#!/bin/bash
set -e

echo "Configuring Prometheus to scrape Node Exporter..."

sudo sed -i '/scrape_configs:/a \ \ - job_name: "node_exporter"\n    static_configs:\n      - targets: ["localhost:9100"]' /etc/prometheus/prometheus.yml

sudo systemctl restart prometheus

echo "Prometheus teper scrapes Node Exporter metrics"
