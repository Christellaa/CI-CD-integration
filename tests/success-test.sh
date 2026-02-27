#!/bin/bash
set -e

HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:8081/)

if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "Unit test passed: Received HTTP 200"
else
    echo "Unit test failed: Expected HTTP 200 but got $HTTP_STATUS"
    exit 1
fi
