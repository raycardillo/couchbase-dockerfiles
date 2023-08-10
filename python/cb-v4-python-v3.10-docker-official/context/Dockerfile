FROM python:3.10

LABEL org.opencontainers.image.authors="Ray Cardillo"

COPY ./bashrc /root/.bashrc
COPY ./couchbase-python-examples/ /home/couchbase-python-examples/

ENV container docker
ENV PATH=".:${PATH}"
ENV TERM="xterm-256color"

RUN apt-get update -y \
    && \
    apt-get install -y \
    git cmake build-essential \
    software-properties-common \
    libzip-dev zip \
    wget curl jq \
    ruby gnupg2  \
    sed vim \
    openssl libssl-dev

WORKDIR /home

RUN pip install --upgrade pip \
    && \
    python3 -m pip install --upgrade setuptools \
    && \
    python3 -m pip install couchbase

WORKDIR /home

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
