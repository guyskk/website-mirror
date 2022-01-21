#!/bin/bash

set -e

docker build --platform linux/amd64 -t guyskk/website-mirror:latest-amd64 .
docker build --platform linux/arm64 -t guyskk/website-mirror:latest-arm64 .
