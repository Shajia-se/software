FROM debian:bullseye-slim

LABEL maintainer "shajia.se@gmail.com"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get -yq dist-upgrade && \
    apt-get install -yq openjdk-17-jre perl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cp /nexus/posix0/MAGE-flaski/service/projects/code/Bioinformatics/bit_pipe_alternative_splicing/libraries/sajr_code/SAJR.tar.gz . && \
    tar -xzf SAJR.tar.gz && \
    cp /snpEff/snpEff.jar .

ENV PATH="/snpEff.jar:${PATH}"
