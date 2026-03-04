FROM bioconductor/bioconductor_docker:RELEASE_3_18

RUN R -q -e " \
  options(repos = c(CRAN='https://cloud.r-project.org')); \
  if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager'); \
  BiocManager::install(c( \
    'ChIPseeker', \
    'TxDb.Mmusculus.UCSC.mm39.knownGene', \
    'org.Mm.eg.db', \
    'clusterProfiler', \
    'enrichplot', \
    'DOSE', \
    'ChIPpeakAnno', \
    'GenomicFeatures', \
    'GenomicRanges', \
    'GenomeInfoDb', \
    'IRanges', \
    'ReactomePA' \
  ), ask = FALSE, update = FALSE); \
  install.packages(c( \
    'ggplot2', \
    'dplyr', \
    'tidyr', \
    'openxlsx' \
  )); \
  ip <- rownames(installed.packages()); \
  needed <- c( \
    'ChIPseeker', \
    'org.Mm.eg.db', \
    'clusterProfiler', \
    'ChIPpeakAnno', \
    'GenomicFeatures', \
    'GenomeInfoDb', \
    'ReactomePA', \
    'openxlsx' \
  ); \
  miss <- setdiff(needed, ip); \
  if (length(miss) > 0) { \
    message('Missing packages: ', paste(miss, collapse=', ')); \
    q(status = 1); \
  } \
"
