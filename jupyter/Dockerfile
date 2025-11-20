FROM jupyter/base-notebook:latest

LABEL maintainer="shajia.se@gmail.com"

ENV NB_USER=sjiang \
    NB_UID=501 \
    NB_GID=1010

USER root

RUN groupadd -g ${NB_GID} ${NB_USER} && \
    useradd -m -s /bin/bash -N -u ${NB_UID} -g ${NB_GID} ${NB_USER}

RUN apt-get update && apt-get install -y \
    git curl wget build-essential \
    libglpk-dev libhdf5-dev libjpeg-dev libpng-dev libtiff-dev libgdal-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
        jupyterlab \
        pandas numpy matplotlib seaborn scipy \
        scikit-learn biopython scanpy anndata \
        ipywidgets openpyxl plotly

RUN mkdir -p /home/${NB_USER}/work && chown -R ${NB_USER}:${NB_GID} /home/${NB_USER}

WORKDIR /home/${NB_USER}/work

USER ${NB_UID}

ENV HOME=/home/sjiang

CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.ip='0.0.0.0'"]

