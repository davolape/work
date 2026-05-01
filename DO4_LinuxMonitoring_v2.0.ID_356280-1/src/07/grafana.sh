#!/bin/bash
set -e

echo " Installing Grafana..."

sudo apt update
sudo apt install -y apt-transport-https software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt update
sudo apt install grafana -y

sudo systemctl enable --now grafana-server

echo "Grafana is running on http://localhost:3000 (login: admin / admin)"
