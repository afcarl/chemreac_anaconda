FROM ubuntu:14.04.4
MAINTAINER Björn Dahlgren <bjodah@DELETEMEgmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /opt/conda/bin:$PATH
ENV LANG C.UTF-8
RUN locale-gen en_US.UTF-8 && \
    echo "path-exclude /usr/share/doc/*" >/etc/dpkg/dpkg.cfg.d/01_nodoc && \
    echo "path-include /usr/share/doc/*/copyright" >>/etc/dpkg/dpkg.cfg.d/01_nodoc && \
    apt-get update && \
    apt-get --assume-yes --no-install-recommends install \
        wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 \
        build-essential gfortran binutils-dev && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-3.19.0-Linux-x86_64.sh && \
    /bin/bash /Miniconda2-3.19.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda2-3.19.0-Linux-x86_64.sh && \
    conda install --yes conda==4.0.2 conda-build
RUN \
    echo "always_yes: True" >/root/.condarc && \
    mkdir /root/conda-envs/ && \
    conda create --name py27_ python==2.7.11 && \
    conda create --name py34_ python==3.4.4 && \
    conda create --name py35_ python==3.5.1
