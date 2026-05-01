#!/bin/bash

set -e

echo "DEPLOY STARTED"

PROD_USER=davolape2
PROD_HOST=192.168.0.105
TMP_PATH=/home/davolape2
TARGET_PATH=/usr/local/bin
BINARY=code-samples/DO

if [ ! -f "$BINARY" ]; then
  echo "ERROR: Binary not found"
  exit 1
fi

echo "Copying binary to temporary directory..."

scp -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    "$BINARY" "${PROD_USER}@${PROD_HOST}:${TMP_PATH}/DO"

echo "Moving binary to /usr/local/bin with sudo..."

ssh -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    "${PROD_USER}@${PROD_HOST}" \
    "sudo mv ${TMP_PATH}/DO ${TARGET_PATH}/DO && sudo chmod +x ${TARGET_PATH}/DO"

echo "DEPLOY FINISHED SUCCESSFULLY"

