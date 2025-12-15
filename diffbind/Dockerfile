FROM r-base:4.3.2
LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libudunits2-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN R -q -e 'options(repos = c(CRAN="https://cloud.r-project.org")); \
    if (!"BiocManager" %in% rownames(installed.packages())) install.packages("BiocManager"); \
    BiocManager::install(c( \
        "DiffBind", \
        "DESeq2", \
        "GenomicRanges", \
        "SummarizedExperiment", \
        "BiocParallel" \
    ), ask=FALSE, update=FALSE); \
    ip <- installed.packages(); \
    cat("\n=== Installed packages ===\n"); \
    print(ip[c("DiffBind","DESeq2","ChIPQC","GenomicRanges","SummarizedExperiment","BiocParallel"), \
           c("Package","Version","LibPath")]); \
    cat("\n=== SessionInfo ===\n"); \
    sessionInfo()'
