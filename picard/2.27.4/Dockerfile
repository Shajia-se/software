FROM openjdk:22-jdk-slim-bullseye

LABEL maintainer="shajia.se@gmail.com"

ARG PICARD_VERSION=2.27.4

ENV PICARD_HOME=/opt/picard

# Install R + wget + ca-certificates
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base \
        wget \
        ca-certificates && \
    Rscript -e 'install.packages("ggplot2", repos="https://cloud.r-project.org")' && \
    rm -rf /var/lib/apt/lists/*

# Download Picard
RUN mkdir -p "${PICARD_HOME}" && \
    wget -q "https://github.com/broadinstitute/picard/releases/download/${PICARD_VERSION}/picard.jar" \
        -O "${PICARD_HOME}/picard.jar"

# Work directory where users will mount data
WORKDIR /data

# Default entrypoint: run Picard by default
ENTRYPOINT ["java", "-jar", "/opt/picard/picard.jar"]

# Add `picard` wrapper so you can run "picard <ToolName>" directly
RUN printf '#!/usr/bin/env bash\nexec java -jar /opt/picard/picard.jar "$@"\n' \
    > /usr/local/bin/picard && \
    chmod +x /usr/local/bin/picard