FROM bioconductor/bioconductor_docker:RELEASE_3_16
LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    libmagick++-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
 && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'options(repos = c(CRAN = "https://cloud.r-project.org")); install.packages(c( \
    "dplyr", \
    "tidyr", \
    "readr", \
    "tibble", \
    "patchwork", \
    "pheatmap", \
    "RColorBrewer", \
    "openxlsx" \
))'

RUN Rscript -e 'BiocManager::install(c( \
      "tximport", \
      "tximportData", \
      "rhdf5", \
      "DESeq2", \
      "apeglm", \
      "genefilter", \
      "BiocParallel", \
      "AnnotationDbi", \
      "org.Mm.eg.db", \
      "biomaRt", \
      "EnhancedVolcano", \
      "DOSE", \
      "treeio", \
      "tidytree", \
      "ggtree", \
      "enrichplot", \
      "clusterProfiler", \
      "ReactomePA" \
    ), ask = FALSE, update = FALSE)'

RUN Rscript -e 'ip <- rownames(installed.packages()); needed <- c( \
      "tximport", \
      "DESeq2", \
      "apeglm", \
      "AnnotationDbi", \
      "org.Mm.eg.db", \
      "EnhancedVolcano", \
      "ggtree", \
      "clusterProfiler", \
      "ReactomePA", \
      "openxlsx" \
    ); miss <- setdiff(needed, ip); if(length(miss) > 0) { message("Missing packages: ", paste(miss, collapse = ", ")); q(status = 1) }'
