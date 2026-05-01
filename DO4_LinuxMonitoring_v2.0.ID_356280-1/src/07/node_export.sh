#!/bin/bash
set -e

echo "Installing Node Exporter..."

sudo useradd --no-create-home --shell /bin/false node_exporter

VERSION=$(curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest | grep tag_name | cut -d '"' -f 4)
ARCHIVE_URL=$(curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest | grep browser_download_url | grep linux-amd64.tar.gz | cut -d '"' -f 4)
wget "$ARCHIVE_URL"
ARCHIVE=$(basename "$ARCHIVE_URL")
tar xvf "$ARCHIVE"
DIR=$(tar -tf "$ARCHIVE" | head -1 | cut -f1 -d"/")
cd "$DIR"

sudo cp node_exporter /usr/local/bin/

sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl enable --now node_exporter

echo "Node Exporter is running on http://localhost:9100"
