#!/bin/bash
BASE_PATH=$(unset CDPATH && cd "$(dirname $0)" && echo $PWD)
DOCKERIMAGE=continuumio/miniconda

if [[ ! -d opt_test ]]; then
    mkdir opt_test
    chmod 777 opt_test
    cat <<EOF | docker run --rm -v $BASE_PATH/opt_test:/new_opt -i $DOCKERIMAGE bash -x
cp -r /opt/* /new_opt/
EOF
fi

docker run --rm -v $(pwd):/chemreac_anaconda -v $BASE_PATH/opt_test:/opt -it $DOCKERIMAGE /chemreac_anaconda/_run_tests.sh

