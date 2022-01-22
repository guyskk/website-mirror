#!/bin/bash

set -e

echo "*** Publish guyskk/pypi-mirror:latest ***"
docker push guyskk/pypi-mirror:latest-amd64
docker push guyskk/pypi-mirror:latest-arm64
