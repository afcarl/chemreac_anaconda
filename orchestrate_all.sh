#!/bin/bash -xe
which start_cpp98.sh
BASE_PATH=$(unset CDPATH && cd "$(dirname $0)" && echo $PWD)

if [[ ! -d opt ]]; then
    mkdir opt
    cat <<EOF | docker run --rm -v $BASE_PATH/opt:/new_opt -i continuumio/conda_builder_linux:latest bash -x
cp -r /opt/miniconda /new_opt/
EOF
fi

start_cpp98.sh -v /home/bjorn/vc/chemreac_anaconda:/home/dev/chemreac_anaconda -v $BASE_PATH/opt:/opt ./chemreac_anaconda/entrypoint.sh $@
