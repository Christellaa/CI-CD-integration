#!/bin/bash
set -e

VERSION=v1

docker build -t $DOCKER_USERNAME/ci-cd-integration-img:$VERSION .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push $DOCKER_USERNAME/ci-cd-integration-img:$VERSION
