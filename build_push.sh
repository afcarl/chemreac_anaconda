#!/bin/bash -x
echo "show_channel_urls: true" >>~/.condarc
cd $(dirname $0)
./build_all.sh
scp -r -o StrictHostKeyChecking=no /opt/miniconda/conda-bld/ chemreac@hera.physchem.kth.se:~/chemreac_anaconda-conda-bld
