#!/bin/bash

set -e

echo "*** Publish guyskk/npm-mirror:latest ***"
docker push guyskk/npm-mirror:latest-amd64
docker push guyskk/npm-mirror:latest-arm64

echo "*** Create manifest guyskk/npm-mirror:latest ***"
docker manifest create guyskk/npm-mirror:latest \
    --amend guyskk/npm-mirror:latest-arm64 \
    --amend guyskk/npm-mirror:latest-amd64

docker manifest push guyskk/npm-mirror:latest
