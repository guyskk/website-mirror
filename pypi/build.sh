#!/bin/bash

set -e

echo "*** Build guyskk/pypi-mirror ***"
docker build --platform linux/amd64 \
    --build-arg NGINX_CONF=pypi/nginx.conf \
    -t guyskk/pypi-mirror:latest-amd64 .
docker build --platform linux/arm64 \
    --build-arg NGINX_CONF=pypi/nginx.conf \
    -t guyskk/pypi-mirror:latest-arm64 .
