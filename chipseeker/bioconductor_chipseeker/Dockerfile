FROM bioconductor/bioconductor_docker:RELEASE_3_18

RUN R -q -e "if (!requireNamespace('BiocManager', quietly = TRUE)) \
              install.packages('BiocManager'); \
              BiocManager::install('ChIPseeker', ask = FALSE, update = FALSE); \
              ip <- rownames(installed.packages()); \
              if (!'ChIPseeker' %in% ip) q(status = 1)"

RUN R -q -e " \
  if (!requireNamespace('BiocManager', quietly = TRUE)) \
    install.packages('BiocManager'); \
  BiocManager::install(c( \
    'TxDb.Mmusculus.UCSC.mm39.knownGene', \
    'org.Mm.eg.db', \
    'clusterProfiler', \
    'enrichplot', \
    'DOSE' \
  ), ask = FALSE, update = FALSE); \
  install.packages(c('ggplot2','dplyr','tidyr','openxlsx')); \
  ip <- rownames(installed.packages()); \
  if (!'TxDb.Mmusculus.UCSC.mm39.knownGene' %in% ip) q(status = 1) \
"

