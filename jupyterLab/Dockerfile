# Use official Jupyter base image
FROM jupyter/base-notebook:latest

LABEL maintainer "shajia.se@gmail.com"

# Install any extra packages if needed, e.g., bioinformatics tools
RUN pip install --no-cache-dir pandas numpy matplotlib scipy seaborn scikit-learn biopython

# Expose port for JupyterLab
EXPOSE 8888

# Start JupyterLab server
CMD ["start.sh", "jupyter", "lab", "--LabApp.token=''", "--LabApp.ip='0.0.0.0'", "--LabApp.allow_origin='*'", "--LabApp.notebook_dir=/home/jovyan/work"]
