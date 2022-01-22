#!/bin/bash

set -e

echo "*** Publish guyskk/pypi-mirror:latest ***"
docker push guyskk/pypi-mirror:latest-amd64
docker push guyskk/pypi-mirror:latest-arm64

echo "*** Create manifest guyskk/pypi-mirror:latest ***"
docker manifest create guyskk/pypi-mirror:latest \
    --amend guyskk/pypi-mirror:latest-arm64 \
    --amend guyskk/pypi-mirror:latest-amd64

docker manifest push guyskk/pypi-mirror:latest
