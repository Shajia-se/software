FROM debian:bullseye-slim

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      wget \
      ca-certificates \
      make \
      g++ \
      zlib1g-dev \
      libisal-dev \
      libdeflate-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

ARG FASTP_VERSION=1.0.1
RUN wget -q https://github.com/OpenGene/fastp/archive/refs/tags/v${FASTP_VERSION}.tar.gz \
 && tar -xzf v${FASTP_VERSION}.tar.gz \
 && cd fastp-${FASTP_VERSION} \
 && make \
 && cp fastp /usr/local/bin/fastp \
 && cd /opt \
 && rm -rf fastp-${FASTP_VERSION} v${FASTP_VERSION}.tar.gz
