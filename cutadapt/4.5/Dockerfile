FROM python:3.8-slim-bullseye

LABEL maintainer="shajia.se@gmail.com"
ARG CUTADAPT_VERSION=4.5

RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir "cutadapt==${CUTADAPT_VERSION}" \
 && cutadapt --version

ENTRYPOINT ["cutadapt"]
CMD ["--help"]
