FROM r-base:4.3.2
LABEL maintainer="shajia.se@gmail.com"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq \
    build-essential \
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
    liblzma-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN R -q -e 'options(repos = c(CRAN = "https://cloud.r-project.org")) ; \
  if (!"BiocManager" %in% rownames(installed.packages())) \
    install.packages("BiocManager") ; \
  install.packages(c("openxlsx", "ggplot2", "circlize")) ; \
  BiocManager::install(c( \
    "ChIPseeker", \
    "AnnotationDbi", \
    "GenomicRanges", \
    "ReactomePA", \
    "GenomicRanges",\
    "org.Mm.eg.db", \
    "TxDb.Mmusculus.UCSC.mm10.knownGene", \
    "TxDb.Mmusculus.UCSC.mm39.knownGene" \
  ), ask = FALSE, update = FALSE)'
