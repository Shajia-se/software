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
      unzip \
      python3 \
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

ARG BEDTOOLS_VERSION=2.31.1

RUN wget -q https://github.com/arq5x/bedtools2/releases/download/v${BEDTOOLS_VERSION}/bedtools-${BEDTOOLS_VERSION}.tar.gz \
 && tar -xzf bedtools-${BEDTOOLS_VERSION}.tar.gz \
 && cd bedtools2 \
 && make -j"$(nproc)" \
 && cp bin/bedtools /usr/local/bin/bedtools \
 && cd / \
 && rm -rf bedtools2 bedtools-${BEDTOOLS_VERSION}.tar.gz

RUN python3 --version \
 && samtools --version | head -n 1 \
 && bedtools --version

WORKDIR /data
