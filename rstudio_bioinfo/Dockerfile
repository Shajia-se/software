FROM rocker/tidyverse:latest

# ------------------------------------------------------------
# System dependencies
# - imagemagick/libmagick++ : for magick-related dependencies (GSVA/SpatialExperiment chain may touch)
# - libglpk40              : REQUIRED to fix igraph load error (libglpk.so.40) -> enrichplot/clusterProfiler
# - build deps             : make Bioconductor compilation more reliable
# ------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Core build/toolchain deps (often needed for Bioc packages)
    build-essential \
    gfortran \
    pkg-config \
    git \
    # SSL / curl / xml (common R package deps)
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    # Fonts/graphics (often required by plotting packages)
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    # ImageMagick (fix magick.so / ImageMagick issues)
    imagemagick \
    libmagick++-dev \
    # GLPK (fix igraph.so -> libglpk.so.40 missing)
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

# fgsea is on CRAN (reliable via CRAN)
RUN R -e "options(repos=c(CRAN='https://cloud.r-project.org')); \
install.packages('fgsea', Ncpus=parallel::detectCores())"

# ------------------------------------------------------------
# Bioconductor packages
# ------------------------------------------------------------
RUN R -e "options(repos=c(CRAN='https://cloud.r-project.org')); \
if (!requireNamespace('BiocManager', quietly=TRUE)) install.packages('BiocManager'); \
BiocManager::install(version = '3.18', ask=FALSE); \
BiocManager::install(c( \
  'DESeq2','edgeR','limma','tximport','biomaRt', \
  'org.Mm.eg.db','AnnotationDbi','clusterProfiler','enrichplot','DOSE', \
  'EnhancedVolcano','GSEABase','WGCNA','GenomicFeatures', \
  'Gviz','AnnotationHub','TxDb.Mmusculus.UCSC.mm10.knownGene', \
  'ComplexHeatmap','GSVA','SpatialExperiment' \
), ask=FALSE, update=FALSE, Ncpus=parallel::detectCores())"

# ------------------------------------------------------------
# Proteomics / Metabolomics related
# ------------------------------------------------------------
RUN R -e "options(repos=c(CRAN='https://cloud.r-project.org')); \
if (!requireNamespace('BiocManager', quietly=TRUE)) install.packages('BiocManager'); \
BiocManager::install(c('MSnbase','DEP'), ask=FALSE, update=FALSE, Ncpus=parallel::detectCores()); \
install.packages(c('MetaboAnalystR','ropls','mixOmics','pathview'), Ncpus=parallel::detectCores())"

# ------------------------------------------------------------
# Optional: quick sanity check during build (fail fast if missing)
# Comment out if you prefer a faster build.
# ------------------------------------------------------------
RUN R -e "library(igraph); \
library(clusterProfiler); library(enrichplot); \
library(msigdbr); library(ComplexHeatmap); library(GSVA); library(fgsea); \
cat('All key libraries loaded successfully.\\n')"

# ------------------------------------------------------------
# Workdir / port
# ------------------------------------------------------------
WORKDIR /home/rstudio/project
EXPOSE 8787
