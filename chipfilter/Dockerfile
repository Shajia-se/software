FROM debian:bullseye-slim

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      wget \
      ca-certificates \
      make \
      gcc \
      g++ \
      zlib1g-dev \
      libbz2-dev \
      liblzma-dev \
      libncurses5-dev \
      libncursesw5-dev \
      bzip2 \
      tar \
      curl \
 && rm -rf /var/lib/apt/lists/*

ARG SAMTOOLS_VERSION=1.16.1

RUN wget -q https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 \
 && tar -xjf samtools-${SAMTOOLS_VERSION}.tar.bz2 \
 && cd samtools-${SAMTOOLS_VERSION} \
 && ./configure --prefix=/usr/local \
 && make -j"$(nproc)" \
 && make install \
 && cd / \
 && rm -rf samtools-${SAMTOOLS_VERSION} samtools-${SAMTOOLS_VERSION}.tar.bz2

ARG BEDTOOLS_VERSION=2.30.0

RUN wget -q https://github.com/arq5x/bedtools2/releases/download/v${BEDTOOLS_VERSION}/bedtools.static.binary \
 && chmod +x bedtools.static.binary \
 && mv bedtools.static.binary /usr/local/bin/bedtools

RUN samtools --version && bedtools --version

# /usr/local/bin
