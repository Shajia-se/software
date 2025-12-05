FROM python:3.8-slim-bullseye

LABEL maintainer="shajia.se@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      python3-dev \
      wget \
      unzip \
      ca-certificates \
      samtools \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
      "numpy<1.24" \
      "scipy<1.10" \
      "matplotlib<3.6"

RUN pip install --no-cache-dir MACS2

RUN wget -O idr-2.0.3.zip https://github.com/nboley/idr/archive/refs/tags/2.0.3.zip \
 && unzip idr-2.0.3.zip \
 && cd idr-2.0.3 \
 && python setup.py install \
 && cd / \
 && rm -rf idr-2.0.3 idr-2.0.3.zip

RUN echo "Checking IDR installation..." \
 && which idr \
 && idr -h \
 && echo "Checking MACS2..." \
 && which macs2 \
 && macs2 --version \
 && echo "Checking samtools..." \
 && which samtools \
 && samtools --version

CMD ["idr", "-h"]
