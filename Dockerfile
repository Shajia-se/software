FROM bioconductor/bioconductor_docker:RELEASE_3_19

LABEL maintainer="shajia.se@gmail.com" \
      org.opencontainers.image.description="Enrichment + basic visualization (clusterProfiler/enrichplot/fgsea/ggplot2)"

ENV DEBIAN_FRONTEND=noninteractive

# System deps (minimal)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# R packages: core set
RUN R -q -e 'options(Ncpus=parallel::detectCores()); \
  BiocManager::install(c( \
    "clusterProfiler", "enrichplot", "DOSE", \
    "ReactomePA", "pathview", \
    "fgsea", "msigdbr", \
    "AnnotationDbi", "org.Mm.eg.db", "org.Hs.eg.db" \
  ), ask=FALSE, update=FALSE); \
  install.packages(c("ggplot2","patchwork","cowplot","ggrepel","ggpubr","data.table","readr","dplyr","tibble"), repos="https://cloud.r-project.org"); \
  sessionInfo()'
