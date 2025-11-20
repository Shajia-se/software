FROM debian:bullseye-slim

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# system deps
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      wget \
      ca-certificates \
      bedtools \
      libcurl4-openssl-dev \
 && rm -rf /var/lib/apt/lists/*

# install UCSC bedGraphToBigWig
RUN wget -q https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig \
      -O /usr/local/bin/bedGraphToBigWig \
 && chmod +x /usr/local/bin/bedGraphToBigWig
