FROM openjdk:22-jdk-slim-bullseye

LABEL maintainer="shajia.se@gmail.com"

# Optional: make version easy to change at build time
ARG PICARD_VERSION=3.4.0

ENV PICARD_HOME=/opt/picard

# Install only what we really need, no dist-upgrade, no extra repos
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download Picard
RUN mkdir -p "${PICARD_HOME}" && \
    wget -q "https://github.com/broadinstitute/picard/releases/download/${PICARD_VERSION}/picard.jar" \
        -O "${PICARD_HOME}/picard.jar"

# Work directory where users will mount data
WORKDIR /data

# Default entrypoint: run Picard; you can append the subcommand/args
ENTRYPOINT ["java", "-jar", "/opt/picard/picard.jar"]
