#!/bin/bash
set -e

VERSION=v2
git tag -a $VERSION -m "Release version $VERSION"
git push origin $VERSION

docker build -t $DOCKER_USERNAME/ci-cd-integration-img:$VERSION .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push $DOCKER_USERNAME/ci-cd-integration-img:$VERSION
