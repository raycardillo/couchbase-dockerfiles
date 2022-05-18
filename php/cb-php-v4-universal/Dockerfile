FROM php:8.1-bullseye

LABEL org.opencontainers.image.authors="Ray Cardillo"

ENV container docker
ENV PATH=".:${PATH}"

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

# building from source to support M1 macs as well
RUN git clone --recurse-submodules -b 4.0.0 https://github.com/couchbase/couchbase-php-client.git

WORKDIR /home/couchbase-php-client

# For testing PRs
#RUN git fetch origin pull/6/head \
#    && \
#    git checkout -b pullrequest FETCH_HEAD

ENV CB_PHP_PREFIX=/usr/local

RUN ./bin/build
RUN ./bin/package

RUN pecl install couchbase-4.0.0.tgz \
    && \
    docker-php-ext-enable couchbase

COPY ./couchbase-php-examples/ /home/couchbase-php-examples/
WORKDIR /home/couchbase-php-examples

RUN ./install-composer.sh \
    && \
    composer install

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
