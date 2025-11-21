# ---------- builder stage ----------
FROM debian:bullseye-slim AS builder

ARG SAMTOOLS_VERSION=1.21
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl ca-certificates \
    tar bzip2 make gcc g++ \
    zlib1g-dev libbz2-dev liblzma-dev libncurses5-dev \
    libcurl4-openssl-dev libssl-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN curl -L -o samtools.tar.bz2 \
      https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 \
 && tar -xjf samtools.tar.bz2 \
 && cd samtools-${SAMTOOLS_VERSION} \
 && ./configure --prefix=/usr/local \
 && make -j"$(nproc)" \
 && make install

# ---------- runtime stage ----------
FROM debian:bullseye-slim

ARG SAMTOOLS_VERSION=1.21
LABEL maintainer="shajia.se@gmail.com" \
      org.opencontainers.image.title="samtools" \
      org.opencontainers.image.version="${SAMTOOLS_VERSION}" \
      org.opencontainers.image.source="https://github.com/samtools/samtools"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    zlib1g libbz2-1.0 liblzma5 \
    libncursesw6 libtinfo6 \
    libcurl4 libssl1.1 \
  && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/ /usr/local/

RUN samtools --version

ENTRYPOINT ["samtools"]
CMD ["--help"]
