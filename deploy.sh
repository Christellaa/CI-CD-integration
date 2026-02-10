#!/bin/bash
set -e

docker build -t $DOCKER_USERNAME/ci-cd-integration-img:latest .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push $DOCKER_USERNAME/ci-cd-integration-img:latest
