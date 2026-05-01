#!/usr/bin/bash

set -euo pipefail

DASHBOARD_ID="${1:-}"
GRAFANA_URL="http://localhost:3000"
API_KEY="THE_GRAFANA_TOKEN" 

die(){ echo "ERROR: $*" >&2; exit 1; }

[ -n "$DASHBOARD_ID" ] || die "Dashboard ID is required"

echo "Downloading dashboard ID $DASHBOARD_ID..."
curl -s "https://grafana.com/api/dashboards/$DASHBOARD_ID/revisions/latest/download" -o /tmp/dashboard.json

echo "Importing dashboard into Grafana..."
curl -X POST "$GRAFANA_URL/api/dashboards/import" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d @/tmp/dashboard.json

echo "Dashboard $DASHBOARD_ID imported successfully."
