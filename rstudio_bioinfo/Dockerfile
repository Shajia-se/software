# ============================================================
# RNA-seq RStudio image (stable + Bioconductor-safe)
# - Fixes Bioconductor repo override (p3m) issue
# - Fixes igraph/enrichplot/clusterProfiler GLPK runtime error
# - Includes fail-fast checks so build fails if key pkgs missing
# ============================================================

# Pin the base image to avoid "latest" drift.
# This should match your current session (R 4.5.2).
FROM rocker/tidyverse:4.5.2

# ------------------------------------------------------------
# System dependencies
# ------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    # build toolchain (often needed by Bioc packages)
    build-essential \
    gfortran \
    pkg-config \
    git \
    # common system libs for R packages
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    # graphics/text deps
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    # ImageMagick (magick.so related)
    imagemagick \
    libmagick++-dev \
    # GLPK (fix: libglpk.so.40 missing for igraph -> enrichplot/clusterProfiler)
    libglpk40 \
    libglpk-dev \
 && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------
# CRAN packages
# ------------------------------------------------------------
RUN R -e "options(repos=c(CRAN='https://cloud.r-project.org')); \
install.packages(c( \
  'data.table','janitor','pheatmap','ggpubr','ggsignif','rstatix','factoextra', \
  'RColorBrewer','viridis','gprofiler2','msigdbr','openxlsx','readxl','ggrepel', \
  'circlize','patchwork','stringr','lubridate','remotes' \
), Ncpus=parallel::detectCores())"

# fgsea is CRAN (most reliable via CRAN)
RUN R -e "options(repos=c(CRAN='https://cloud.r-project.org')); \
install.packages('fgsea', Ncpus=parallel::detectCores())"

# ------------------------------------------------------------
# Bioconductor packages (IMPORTANT: reset repos to Bioc standard)
# ------------------------------------------------------------
RUN R -e "options(repos=c(CRAN='https://cloud.r-project.org')); \
if (!requireNamespace('BiocManager', quietly=TRUE)) install.packages('BiocManager'); \
options(repos=BiocManager::repositories()); \
BiocManager::install(c( \
  'DESeq2','edgeR','limma','tximport','biomaRt', \
  'org.Mm.eg.db','AnnotationDbi', \
  'DOSE','clusterProfiler','enrichplot', \
  'EnhancedVolcano','GSEABase','WGCNA','GenomicFeatures', \
  'Gviz','AnnotationHub','TxDb.Mmusculus.UCSC.mm10.knownGene', \
  'ComplexHeatmap','GSVA','SpatialExperiment' \
), ask=FALSE, update=FALSE, force=TRUE, Ncpus=parallel::detectCores())"

# ------------------------------------------------------------
# Proteomics / Metabolomics related
# ------------------------------------------------------------
RUN R -e "options(repos=c(CRAN='https://cloud.r-project.org')); \
if (!requireNamespace('BiocManager', quietly=TRUE)) install.packages('BiocManager'); \
options(repos=BiocManager::repositories()); \
BiocManager::install(c('MSnbase','DEP'), ask=FALSE, update=FALSE, force=TRUE, Ncpus=parallel::detectCores()); \
install.packages(c('MetaboAnalystR','ropls','mixOmics','pathview'), Ncpus=parallel::detectCores())"

# ------------------------------------------------------------
# Fail-fast checks (so build will FAIL if key pkgs not usable)
# ------------------------------------------------------------
RUN R -e "options(repos=BiocManager::repositories()); \
pkgs <- c('igraph','clusterProfiler','enrichplot'); \
miss <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly=TRUE)]; \
if (length(miss)) stop('Missing packages: ', paste(miss, collapse=', ')); \
library(igraph); library(clusterProfiler); library(enrichplot); \
cat('OK: igraph + clusterProfiler + enrichplot load successfully\\n')"

# ------------------------------------------------------------
# Workdir / port
# ------------------------------------------------------------
WORKDIR /home/rstudio/project
EXPOSE 8787
