FROM debian:bullseye-slim

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# System dependencies to build BWA
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      wget \
      ca-certificates \
      tar \
      pigz \
      curl \
      bzip2 \
      build-essential \
      libncurses-dev \
      zlib1g-dev \
      libbz2-dev \
      liblzma-dev \
 && rm -rf /var/lib/apt/lists/*

# Build BWA 0.7.17
WORKDIR /opt
RUN wget -q https://github.com/lh3/bwa/archive/v0.7.17.tar.gz \
 && tar -xzf v0.7.17.tar.gz \
 && cd bwa-0.7.17 \
 && sed -i '3s/$/ -fcommon/' Makefile \
 && make \
 && cp bwa /usr/local/bin/ \
 && cd /opt \
 && rm -rf bwa-0.7.17 v0.7.17.tar.gz

# /usr/local/bin is already in PATH, so no ENV needed
