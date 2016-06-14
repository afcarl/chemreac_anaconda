#!/bin/bash -xe
which start_cpp98.sh
BASE_PATH=$(unset CDPATH && cd "$(dirname $0)" && echo $PWD)

if [[ ! -d conda-bld ]]; then
    mkdir conda-bld
    chmod 777 conda-bld
fi

start_cpp98.sh --rm \
  -v $BASE_PATH:/home/dev/chemreac_anaconda \
  -v $BASE_PATH/conda-bld/svn-cache:/opt/miniconda/conda-bld/svn-cache \
  -v $BASE_PATH/conda-bld/hg-cache:/opt/miniconda/conda-bld/hg-cache \
  -v $BASE_PATH/conda-bld/git-cache:/opt/miniconda/conda-bld/git-cache \
  -v $BASE_PATH/conda-bld/src-cache:/opt/miniconda/conda-bld/src-cache \
  -v $BASE_PATH/conda-bld/linux-64:/opt/miniconda/conda-bld/linux-64 \
  -v $BASE_PATH/conda-bld/linux-32:/opt/miniconda/conda-bld/linux-32 \
  -v $BASE_PATH/conda-bld/noarch:/opt/miniconda/conda-bld/noarch \
  ./chemreac_anaconda/_entrypoint.sh $@
