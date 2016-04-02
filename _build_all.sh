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
for PKG in $PKGS; do
    echo $PKG
    if [[ $PKG == recipes/_* ]]; then
        continue
    fi
    if [[ $PKG == recipes/*/_* ]]; then
        continue
    fi
    if [[ $PKG == recipes/10_* ]] || [[ $PKG == recipes/20_* ]]; then
        conda build ./$PKG
    elif [[ $PKG == recipes/30_* ]] || [[ $PKG == recipes/50_* ]]; then
        for PY in 2.7 3.4 3.5; do
            for NPY in 1.11; do
                conda build --python $PY --numpy $NPY ./$PKG
            done
        done
    elif [[ $PKG == recipes/4?_* ]]; then
        NPY=1.10
        for PY in 2.7 3.4 3.5; do
            conda build --python $PY ./$PKG
        done
    else
        echo "Unkown recipe folder"
        exit 1
    fi
done
