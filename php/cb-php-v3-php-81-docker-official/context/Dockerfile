FROM php:8.1-bullseye

LABEL org.opencontainers.image.authors="Ray Cardillo"

ENV container docker
ENV PATH=".:${PATH}"
ENV TERM="xterm-256color"

# install the required dependencies
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


# Add the couchbase repo source in this layer
RUN wget https://packages.couchbase.com/clients/c/repos/deb/couchbase.key \
    && \
    apt-key add couchbase.key \
    && \
    echo "deb https://packages.couchbase.com/clients/c/repos/deb/debian11 bullseye bullseye/main" | tee /etc/apt/sources.list.d/couchbase.list

# Now that the Couchbase repo is added we can update and install Couchbase deps
RUN apt-get update -y \
    && \
    apt-get install -y \
    libcouchbase-dev \
    libcouchbase3 \
    libcouchbase3-libev \
    libcouchbase3-libevent \
    libcouchbase3-tools

WORKDIR /home

ENV CB_PHP_PREFIX=/usr/local

RUN pecl install https://packages.couchbase.com/clients/php/couchbase-3.2.2.tgz \
    && \
    docker-php-ext-enable couchbase

COPY ./couchbase-php-examples/ /home/couchbase-php-examples/
WORKDIR /home/couchbase-php-examples

RUN ./install-composer.sh \
    && \
    composer install

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
