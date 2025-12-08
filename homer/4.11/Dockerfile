FROM ubuntu:22.04

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV HOMER_HOME=/opt/homer
ENV PATH="${HOMER_HOME}/bin:${PATH}"

RUN apt-get update && apt-get install -y \
    wget \
    perl \
    gcc \
    make \
    libxml2 \
    libxml2-dev \
    libgd-dev \
    libexpat1-dev \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt && \
    cd /opt && \
    wget http://homer.ucsd.edu/homer/configureHomer.pl && \
    perl configureHomer.pl -install

RUN findMotifsGenome.pl 2>&1 | head -n 5 || true

WORKDIR /data
