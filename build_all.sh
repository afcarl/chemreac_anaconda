#!/bin/bash -x
#
#   $ ./build_all.sh
#
#   $ ./build_all.sh recipes/10_non-python/zlib
#

if [ $# -eq 0 ]; then
    PKGS="recipes/10_non-python/*/ recipes/20_python/*/"
else
    PKGS="$@"
fi

for PKG in $PKGS; do
    if [[ $PKG == recipes/20_python* ]]; then
        ./run_in_container.sh ./recipes/ ./output/ "conda build ./input/${PKG##recipes/}" py27 -e CONDA_PY=27
        ./run_in_container.sh ./recipes/ ./output/ "conda build ./input/${PKG##recipes/}" py34 -e CONDA_PY=34
    else
        ./run_in_container.sh ./recipes/ ./output/ "conda build ./input/${PKG##recipes/}"
    fi
done
