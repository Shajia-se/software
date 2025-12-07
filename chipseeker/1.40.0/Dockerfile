FROM bioconductor/bioconductor_docker:RELEASE_3_20
LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libxml2-dev \
    libgsl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libudunits2-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN R -q -e ' \
  options(repos = c(CRAN = "https://cloud.r-project.org")) ; \
  if (!"BiocManager" %in% rownames(installed.packages())) \
    install.packages("BiocManager") ; \
  install.packages(c("openxlsx", "ggplot2")) ; \
  BiocManager::install(c( \
    "ChIPseeker", \
    "AnnotationDbi", \
    "ReactomePA", \
    "GenomicRanges", \
    "TxDb.Celegans.UCSC.ce11.ensGene", \
    "TxDb.Dmelanogaster.UCSC.dm6.ensGene", \
    "TxDb.Hsapiens.UCSC.hg38.knownGene", \
    "TxDb.Mmusculus.UCSC.mm10.knownGene", \
    "TxDb.Mmusculus.UCSC.mm39.knownGene", \
    "TxDb.Scerevisiae.UCSC.sacCer3.sgdGene", \
    "org.Hs.eg.db", \
    "org.Ce.eg.db", \
    "org.Dm.eg.db", \
    "org.Mm.eg.db" \
  ), ask = FALSE, update = FALSE) ; \
  pkgs <- c("ChIPseeker", "ReactomePA", \
            "TxDb.Mmusculus.UCSC.mm39.knownGene", "org.Mm.eg.db") ; \
  invisible(lapply(pkgs, library, character.only = TRUE)) \
'
