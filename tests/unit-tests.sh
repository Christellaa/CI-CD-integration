#!/bin/bash
set -e

echo "Starting unit test..."

IMAGE="ci-cd-test-img"
CONTAINER="ci-cd-test-container"

docker build -t $IMAGE .
docker run -d --name $CONTAINER -p 8081:8081 $IMAGE

sleep 5

errors=0

./tests/success-test.sh || errors=$((errors+1))
./tests/failure-test.sh || errors=$((errors+1))

docker stop $CONTAINER
docker rm $CONTAINER
docker rmi $IMAGE

if [ $errors -ne 0 ]; then
  echo "❌ $errors tests failed"
  exit 1
fi
