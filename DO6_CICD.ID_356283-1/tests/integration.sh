#!/bin/bash

set -e

echo "INTEGRATION TESTS STARTED"

APP="./code-samples/DO"

if [ ! -f "$APP" ]; then
  echo "ERROR: Binary DO not found"
  exit 1
fi

output=$($APP 1)
if [[ "$output" != *"Learning"* ]]; then
  echo "Test 1 failed"
  exit 1
fi

if $APP >/dev/null 2>&1; then
  echo "Test 2 failed"
  exit 1
fi


if $APP 99 >/dev/null 2>&1; then
  echo "Test 3 failed"
  exit 1
fi

echo "INTEGRATION TESTS PASSED SUCCESSFULLY"

