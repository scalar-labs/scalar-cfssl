#!/usr/bin/env bash

set -xe

IMAGE_TAG=1.0.0
CFSSL_GIT_TAG=v1.4.1

rm -rf cfssl
git clone --depth 1 --branch $CFSSL_GIT_TAG https://github.com/cloudflare/cfssl.git cfssl

docker build cfssl -f cfssl/Dockerfile.alpine -t cloudflare-cfssl:$IMAGE_TAG

docker build . -t scalarlabs/scalar-cfssl:$IMAGE_TAG
