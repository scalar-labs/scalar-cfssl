#!/usr/bin/env bash

set -xe

GIT_TAG=v1.4.1
IMAGE_TAG=1.0.0

rm -rf cfssl
git clone --depth 1 --branch $GIT_TAG https://github.com/cloudflare/cfssl.git cfssl

docker build cfssl -t cloudflare-cfssl:$IMAGE_TAG
# TODO: alpine-based image is much smaller
# docker build cfssl -f cfssl/Dockerfile.alpine -t cloudflare-cfssl:$IMAGE_TAG

docker build . -t scalarlabs/scalardl-orchestration-cfssl:$IMAGE_TAG
