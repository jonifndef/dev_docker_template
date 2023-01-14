FROM ubuntu:22.04

# Setup environment
ENV DEBIAN_FRONTEND noninteractive

# The container has no package lists, so need to update first
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends \
        bc \
        build-essential \
        bzr \
        ca-certificates \
        cmake \
        cpio \
        cvs \
        file \
        git \
        libncurses5-dev \
        locales \
        mercurial \
        rsync \
        shellcheck \
        subversion \
        unzip \
        wget \
        swig \
        libpython3.10-dev \
        libssl-dev \
        neovim \
        curl \
        g++ \
        python3-dev \
        python3-setuptools \
        python3-tk \
        python3-wheel \
        python3-pip \
        python3-venv \
        clangd-12 \
        clang-tidy \
        openssh-client \
        device-tree-compiler \
        ninja-build \
        gperf \
        ccache \
        dfu-util \
        xz-utils \
        gcc-multilib \
        g++-multilib \
        libsdl2-dev \
        libmagic1 \
        python3-venv \
        bear \
        clangd-12 \
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
