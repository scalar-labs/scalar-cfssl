ARG BASE_IMAGE

FROM golang:1.13.5-alpine3.11 as builder

RUN set -x && \
    apk add --no-cache git gcc libc-dev && \
    go get bitbucket.org/liamstask/goose/cmd/goose

FROM $BASE_IMAGE

COPY --from=builder /go/bin/goose /usr/local/bin

ENV DATADIR /cfssl/data

RUN mkdir -p $DATADIR

WORKDIR /cfssl

# Copy certdb directory
COPY cfssl/certdb /cfssl/certdb/

# Copy config JSON files
COPY config/*.json ./

# Install bash for docker-entrypoint.sh
RUN set -x && \
    apk add --no-cache bash

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8888 8889
