FROM ubuntu:22.04

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV HOMER_HOME=/opt/homer
ENV PATH="${HOMER_HOME}/bin:${PATH}"

# -------------------------
# 1) Dependencies
# -------------------------
RUN apt-get update && apt-get install -y \
    wget \
    perl \
    gcc \
    make \
    libxml2 \
    libxml2-dev \
    libgd-dev \
    libexpat1-dev \
    git \
    unzip \
  && rm -rf /var/lib/apt/lists/*

# -------------------------
# 2) Install HOMER + genomes
#    (configureHomer.pl lives in /opt, not /opt/homer)
# -------------------------
RUN mkdir -p /opt && \
    cd /opt && \
    wget http://homer.ucsd.edu/homer/configureHomer.pl && \
    perl configureHomer.pl -install && \
    perl configureHomer.pl -install human && \
    perl configureHomer.pl -install mouse

# Optional sanity check
RUN which findMotifsGenome.pl && findMotifsGenome.pl | head -n 5 || true

WORKDIR /data
