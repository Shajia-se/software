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
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
      "numpy<1.24" \
      "scipy<1.10" \
      "matplotlib<3.6"

RUN wget -O idr-2.0.2.zip https://github.com/nboley/idr/archive/2.0.2.zip \
 && unzip idr-2.0.2.zip \
 && cd idr-2.0.2 \
 && python setup.py install \
 && cd / \
 && rm -rf idr-2.0.2 idr-2.0.2.zip

RUN echo "Checking IDR installation..." \
 && which idr \
 && idr -h

CMD ["idr", "-h"]
