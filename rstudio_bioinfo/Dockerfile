FROM rocker/tidyverse:latest

# ----------------------------
# System dependencies (fix magick / image processing issues)
# ----------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    libmagick++-dev \
    imagemagick \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
 && rm -rf /var/lib/apt/lists/*

# ----------------------------
# CRAN packages
# ----------------------------
RUN R -e "install.packages(c(\
  'data.table','janitor','pheatmap','ggpubr','ggsignif','rstatix','factoextra',\
  'RColorBrewer','viridis','gprofiler2','msigdbr','openxlsx','readxl','ggrepel',\
  'circlize','patchwork','stringr','lubridate'\
), repos='https://cloud.r-project.org')"

# fgsea is on CRAN (more reliable via CRAN)
RUN R -e "install.packages('fgsea', repos='https://cloud.r-project.org')"

# ----------------------------
# Bioconductor packages
# ----------------------------
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager', repos='https://cloud.r-project.org'); \
BiocManager::install(c(\
  'DESeq2','edgeR','limma','tximport','biomaRt',\
  'org.Mm.eg.db','AnnotationDbi','clusterProfiler','enrichplot',\
  'EnhancedVolcano','GSEABase','WGCNA','GenomicFeatures',\
  'Gviz','AnnotationHub','TxDb.Mmusculus.UCSC.mm10.knownGene',\
  'ComplexHeatmap','GSVA','SpatialExperiment'\
), ask=FALSE, update=FALSE)"

# ----------------------------
# Proteomics / Metabolomics related
# ----------------------------
RUN R -e "BiocManager::install(c('MSnbase','DEP'), ask=FALSE, update=FALSE); \
install.packages(c('MetaboAnalystR','ropls','mixOmics','pathview'), repos='https://cloud.r-project.org')"

# ----------------------------
# Workdir / port
# ----------------------------
WORKDIR /home/rstudio/project
EXPOSE 8787
