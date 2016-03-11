#!/bin/bash -x
#
#   $ ./build_all.sh
#
#   $ ./build_all.sh recipes/10_non-python/zlib
#

if [ $# -eq 0 ]; then
    PKGS="recipes/*/*/"
else
    PKGS="$@"
fi
echo $PKGS
exit 0
for PKG in $PKGS; do
    if [[ $PKG == recipes/10_* ]] || [[ $PKG == recipes/20_* ]]; then
        ./run_in_container.sh ./recipes/ ./output/ "conda build ./$PKG"

    elif [[ $PKG == recipes/30_* ]] || [[ $PKG == recipes/50_* ]]; then
        for PY in 27 34; do
            ./run_in_container.sh ./recipes/ ./output/ "conda build ./$PKG" py$PY "-e CONDA_PY=$PY -e CONDA_NPY=110"
        done
    elif [[ $PKG == recipes/40_* ]]; then
        ./run_in_container.sh ./recipes/ ./output/ "conda build ./$PKG" py$PY "-e CONDA_PY=$PY"
    else
        echo "Unkown recipe folder"
        exit 1
    fi
done
