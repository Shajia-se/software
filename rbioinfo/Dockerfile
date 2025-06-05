
# 使用 R + tidyverse 的基础镜像
FROM rocker/tidyverse:latest

# 安装常用 CRAN 包
RUN R -e "install.packages(c(\
  'data.table', 'janitor', 'pheatmap', 'ComplexHeatmap', 'ggpubr', \
  'ggsignif', 'rstatix', 'factoextra', 'RColorBrewer', 'viridis', 'gprofiler2' \
))"

# 安装 Bioconductor 包
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager'); \
BiocManager::install(c(\
  'DESeq2', 'edgeR', 'limma', 'tximport', 'biomaRt', \
  'org.Mm.eg.db', 'AnnotationDbi', 'clusterProfiler', 'enrichplot', \
  'EnhancedVolcano', 'GSEABase', 'fgsea', 'WGCNA', \
  'Gviz', 'AnnotationHub', 'TxDb.Mmusculus.UCSC.mm10.knownGene' \
))"

# 安装代谢组与蛋白组分析相关包
RUN R -e "BiocManager::install(c(\
  'MSnbase', 'DEP' \
)); \
install.packages(c('MetaboAnalystR', 'ropls', 'mixOmics', 'pathview'))"

# 设置工作目录
WORKDIR /home/rstudio/project

# 暴露 RStudio Server 端口
EXPOSE 8787
