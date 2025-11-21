FROM debian:bullseye-slim

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# System dependencies to build BWA + samtools/htslib
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
      libcurl4-openssl-dev \
      libssl-dev \
      libdeflate-dev \
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

# Build samtools 1.16.1 (includes htslib)
WORKDIR /opt
RUN wget -q https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2 \
 && tar -xjf samtools-1.16.1.tar.bz2 \
 && cd samtools-1.16.1 \
 && ./configure --prefix=/usr/local \
 && make -j"$(nproc)" \
 && make install \
 && cd /opt \
 && rm -rf samtools-1.16.1 samtools-1.16.1.tar.bz2

# /usr/local/bin is already in PATH
