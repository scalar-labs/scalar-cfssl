#!/usr/bin/env bash

set -xe

SCALAR_CFSSL_IMAGE_TAG=1.0.0
CFSSL_GIT_TAG=v1.4.1

rm -rf cfssl
git clone --depth 1 --branch $CFSSL_GIT_TAG https://github.com/cloudflare/cfssl.git cfssl

WORKING_CFSSL_IMAGE=cloudflare-cfssl:${CFSSL_GIT_TAG#v}-alpine

docker build cfssl -f cfssl/Dockerfile.alpine -t $WORKING_CFSSL_IMAGE
docker build . -t scalarlabs/scalar-cfssl:$SCALAR_CFSSL_IMAGE_TAG --build-arg BASE_IMAGE=$WORKING_CFSSL_IMAGE
docker image rm $WORKING_CFSSL_IMAGE
