#!/bin/bash

set -e

echo "*** Publish guyskk/npm-mirror:latest ***"
docker push guyskk/npm-mirror:latest-amd64
docker push guyskk/npm-mirror:latest-arm64
