# Use official Jupyter base image
FROM jupyter/base-notebook:latest

LABEL maintainer="shajia.se@gmail.com"

# Switch to root to install system packages
USER root

# Install Git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the default jovyan user
USER $NB_UID

# Install any extra packages if needed, e.g., bioinformatics tools
RUN pip install --no-cache-dir pandas numpy matplotlib scipy seaborn scikit-learn biopython

# Expose port for JupyterLab
EXPOSE 8888

# Start JupyterLab server
CMD ["start.sh", "jupyter", "lab", "--LabApp.token=''", "--LabApp.ip='0.0.0.0'", "--LabApp.allow_origin='*'", "--LabApp.notebook_dir=/home/jovyan/work"]
