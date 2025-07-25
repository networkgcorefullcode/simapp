# Copyright 2019-present Open Networking Foundation
# Copyright 2024-present Intel Corporation
#
# SPDX-License-Identifier: Apache-2.0
#

FROM golang:1.24.5-bookworm AS builder

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    vim && \
    apt-get clean

WORKDIR $GOPATH/src/simapp
COPY . .
RUN make all

FROM alpine:3.22 AS simapp

LABEL maintainer="Aether SD-Core <dev@lists.aetherproject.org>" \
    description="Aether open source 5G Core Network" \
    version="Stage 3"

ARG DEBUG_TOOLS

# Install debug tools ~ 50MB (if DEBUG_TOOLS is set to true)
RUN if [ "$DEBUG_TOOLS" = "true" ]; then \
        apk update && apk add --no-cache -U gcompat vim strace net-tools curl netcat-openbsd bind-tools bash; \
        fi

# Copy executable
COPY --from=builder /go/src/simapp/bin/* /usr/local/bin/.
