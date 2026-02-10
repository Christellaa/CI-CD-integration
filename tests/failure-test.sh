#!/bin/bash
set -e

HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:8080/failure)

if [ "$HTTP_STATUS" -eq 404 ]; then
    echo "Unit test passed: Received HTTP 404"
else
    echo "Unit test failed: Expected HTTP 404 but got $HTTP_STATUS"
    exit 1
fi