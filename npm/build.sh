#!/bin/bash

set -e

echo "*** Build guyskk/npm-mirror ***"
docker build --platform linux/amd64 \
    --build-arg NGINX_CONF=npm/nginx.conf \
    -t guyskk/npm-mirror:latest-amd64 .
docker build --platform linux/arm64 \
    --build-arg NGINX_CONF=npm/nginx.conf \
    -t guyskk/npm-mirror:latest-arm64 .
