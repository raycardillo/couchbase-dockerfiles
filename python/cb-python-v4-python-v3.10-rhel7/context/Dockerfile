FROM registry.access.redhat.com/rhel7:7.9-702

LABEL org.opencontainers.image.authors="Ray Cardillo"

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

RUN python3 -m pip install couchbase

COPY ./couchbase-python-examples/ /home/couchbase-python-examples/
WORKDIR /home/couchbase-python-examples

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
