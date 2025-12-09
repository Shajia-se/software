FROM ubuntu:22.04

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV HOMER_HOME=/opt/homer
ENV PATH="${HOMER_HOME}/bin:${PATH}"

RUN apt-get update && apt-get install -y \
    wget \
    perl \
    gcc \
    g++ \
    make \
    tar \
    gzip \
    bzip2 \
    unzip \
    zip \
    zlib1g-dev \
    libgd-dev \
    libexpat1-dev \
    libxml2 \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/homer
RUN set -eux; \
    wget -O configureHomer.pl http://homer.ucsd.edu/homer/configureHomer.pl; \
    chmod +x configureHomer.pl; \
    echo "=== Install HOMER core ==="; \
    perl configureHomer.pl -install homer; \
    echo "=== List HOMER bin ==="; \
    ls -l $HOMER_HOME/bin; \
    echo "=== Install mm10 genome ==="; \
    perl configureHomer.pl -install mm10; \
    echo "=== Available genomes ==="; \
    perl configureHomer.pl -list

RUN set -eux; \
    which annotatePeaks.pl; \
    annotatePeaks.pl 2>&1 | head -n 10 || true

WORKDIR /data
