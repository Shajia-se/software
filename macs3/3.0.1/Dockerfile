FROM python:3.11-slim-bullseye

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# --- Install system dependencies ---
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        python3-dev \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev && \
    rm -rf /var/lib/apt/lists/*

# --- Install Python packages ---
RUN pip install --no-cache-dir macs3==3.0.1 \
    openpyxl==3.1.2 \
    pandas==2.0.3
