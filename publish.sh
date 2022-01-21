#!/bin/bash

set -e

echo "*** Publish guyskk/website-mirror:latest ***"
docker push guyskk/website-mirror:latest-amd64
docker push guyskk/website-mirror:latest-arm64

echo "*** Create manifest guyskk/website-mirror:latest ***"
docker manifest create guyskk/website-mirror:latest \
    --amend guyskk/website-mirror:latest-arm64 \
    --amend guyskk/website-mirror:latest-amd64

docker manifest push guyskk/website-mirror:latest
