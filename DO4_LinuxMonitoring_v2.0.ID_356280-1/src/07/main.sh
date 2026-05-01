#!/bin/bash

#set -e

echo "Nachinaem monitoring..."

bash ./prometheus.sh
bash ./node_export.sh
bash ./grafana.sh
bash ./configi_prometh.sh

echo "Opening Prometheus and Grafana in browser..."
xdg-open http://localhost:9090 &>/dev/null &
xdg-open http://localhost:3000 &>/dev/null &

read -p "Run stress test? (y/n): " answer
if [[ "$answer" == "y" ]]; then
    bash ./stress_test.sh
else
    echo "Skipping the stress test"
fi

echo "Monitoring sdelan/ Prover'te Prometheus i Grafana dashbordi"