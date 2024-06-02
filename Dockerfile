FROM ubuntu:22.04

# Setup environment
ENV DEBIAN_FRONTEND noninteractive

# The container has no package lists, so need to update first
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends \
        bc \
        bear \
        bison \
        build-essential \
        bzr \
        ca-certificates \
        ccache \
        clang-tidy \
        clangd-12 \
        cmake \
        cpio \
        curl \
        cvs \
        device-tree-compiler \
        dfu-util \
        file \
        flex \
        gcc-arm-linux-gnueabi \
        git \
        gperf \
        libelf-dev \
        libmagic1 \
        libncurses5-dev \
        libpython3.10-dev \
        libsdl2-dev \
        libssl-dev \
        locales \
        lzop \
        mercurial \
        ninja-build \
        openssh-client \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-tk \
        python3-venv \
        python3-wheel \
        rsync \
        shellcheck \
        subversion \
        swig \
        unzip \
        wget \
        xz-utils \
        && \
    apt-get -y autoremove && \
    apt-get -y clean

# To be able to generate a toolchain with locales, enable one UTF-8 locale
RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
    /usr/sbin/locale-gen

RUN useradd -ms /bin/bash user && \
    chown -R user:user /home/user

USER user
WORKDIR /home/user
ENV HOME /home/user
ENV LC_ALL en_US.UTF-8
