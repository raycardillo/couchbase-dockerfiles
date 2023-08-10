FROM centos:centos7

LABEL org.opencontainers.image.authors="Ray Cardillo"

ENV container docker
ENV PATH=".:${PATH}"
ENV TERM="xterm-256color"


# needed for building libcouchbase/Python SDK
RUN yum -y update \
    && \
    yum install -y \
    git-all python3-devel python3-pip \
    python3-setuptools gcc gcc-c++ \
    openssl-devel make \
# needed for Python install
    libffi-devel \
# needed to override gcc
    centos-release-scl devtoolset-9 \
# useful tools
    wget vim zip unzip tar \
    lsof lshw sysstat net-tools

 
# override default cmake
RUN yum -y remove cmake
 
WORKDIR /home

RUN wget https://github.com/Kitware/CMake/releases/download/v3.19.8/cmake-3.19.8.tar.gz \
    && \
    tar -xf cmake-3.19.8.tar.gz

WORKDIR cmake-3.19.8 

RUN ./bootstrap \
    && \
    make \
    && \
    make install


# override default gcc 
WORKDIR /home
RUN echo "source /opt/rh/devtoolset-9/enable" >> /etc/bashrc
SHELL ["/bin/bash", "--login", "-c"]

 
# install python 3.8
WORKDIR /home
RUN wget https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz \
    && \
    tar -xf Python-3.8.10.tgz

WORKDIR Python-3.8.10

RUN ./configure --enable-optimizations \
    && \
    make altinstall

# update openssl to 1.1.1
RUN yum install -y pcre-devel zlib-devel gd-devel \
    perl-ExtUtils-Embed libxslt-devel perl-Test-Simple

WORKDIR /usr/src
 
RUN wget https://www.openssl.org/source/old/1.1.1/openssl-1.1.1l.tar.gz \
    && \
    tar -xf openssl-1.1.1l.tar.gz

RUN mv openssl-1.1.1l openssl

WORKDIR openssl

RUN ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl --libdir=/lib64 shared zlib-dynamic && \
    make && \
    make install && \
    mv /usr/bin/openssl /usr/bin/openssl-backup && \
    ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
 
 
# install Python 4.x SDK
WORKDIR /home
RUN python3.8 -m pip install --upgrade pip setuptools wheel
RUN python3.8 -m pip install couchbase


COPY ./couchbase-python-examples/ /home/couchbase-python-examples/
WORKDIR /home/couchbase-python-examples


# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
