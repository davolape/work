#!/bin/bash

#set -e

echo "Installing Prometheus..."

if ! command -v curl &> /dev/null; then
    echo "Installing curl..."
    sudo apt update
    sudo apt install -y curl
fi

VERSION=$(curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep tag_name | cut -d '"' -f 4)
VERSION_CLEAN=${VERSION#v}

sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir -p /etc/prometheus /var/lib/prometheus
cd /tmp

ARCHIVE_URL=$(curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url | grep linux-amd64.tar.gz | cut -d '"' -f 4)
wget "$ARCHIVE_URL"
ARCHIVE=$(basename "$ARCHIVE_URL")

tar xvf $ARCHIVE
DIR=$(tar -tf $ARCHIVE | head -1 | cut -f1 -d"/")
cd "$DIR"

sudo cp prometheus promtool /usr/local/bin/
if [ -d "consoles" ] && [ -d "console_libraries" ]; then
    sudo cp -r consoles console_libraries /etc/prometheus/
else
    echo "Error: consoles or console_libraries not found — skipping copy."
fi

sudo cp prometheus.yml /etc/prometheus/

sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus
After=network.target

[Service]
User=prometheus
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/var/lib/prometheus/

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl enable --now prometheus
