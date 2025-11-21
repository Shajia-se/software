FROM debian:bullseye-slim

LABEL maintainer="shajia.se@gmail.com"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp

RUN apt-get update && apt-get -yq dist-upgrade && \
    apt-get install -yq --no-install-recommends \
      wget curl ca-certificates \
      tar bzip2 pigz \
      build-essential make gcc g++ \
      zlib1g-dev libbz2-dev liblzma-dev \
      libcurl4-openssl-dev \
      libncurses-dev libncursesw6 libtinfo6 \
      libssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    wget -O samtools.tar.bz2 \
      https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2; \
    tar -xjf samtools.tar.bz2; \
    cd samtools-1.16.1; \
    ./configure --prefix=/usr/local; \
    make -j"$(nproc)"; \
    make install; \
    samtools --version

ENTRYPOINT ["samtools"]
CMD ["--help"]
