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
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.0.5-Linux-x86_64.sh && \
    /bin/bash /Miniconda2-4.0.5-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda2-4.0.5-Linux-x86_64.sh && \
    conda install --yes conda conda-build
RUN \
    echo "always_yes: True" >/root/.condarc && \
    mkdir /root/conda-envs/ && \
    conda create --name pyth2.7_nump1.10_ python==2.7.11 numpy=1.10 scipy matplotlib && \
    conda create --name pyth3.4_nump1.10_ python==3.4.4 numpy=1.10 scipy matplotlib && \
    conda create --name pyth3.5_nump1.10_ python==3.5.1 numpy=1.10 scipy matplotlib
