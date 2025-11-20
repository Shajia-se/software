FROM debian:bullseye-slim

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      bowtie2 \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*
