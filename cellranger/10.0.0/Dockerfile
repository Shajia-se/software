FROM ubuntu:22.04

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# Basic build deps
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      wget \
      tar \
      pigz \
      curl \
      bzip2 \
      build-essential \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Copy the Cell Ranger tarball you downloaded manually
COPY cellranger-10.0.0.tar.gz /tmp/

# Install Cell Ranger under /opt and clean up tarball
RUN mkdir -p /opt \
 && tar -xzf /tmp/cellranger-10.0.0.tar.gz -C /opt \
 && rm /tmp/cellranger-10.0.0.tar.gz

# Add Cell Ranger to PATH
ENV PATH="/opt/cellranger-10.0.0:${PATH}"

# Optional: default working directory for data
WORKDIR /data
