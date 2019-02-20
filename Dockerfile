FROM alpine:3.6
MAINTAINER Mahyuddin Susanto <udienz@gmail.com>

RUN apk add --no-cache \
    bash \
    curl \
    grep \
    jq

