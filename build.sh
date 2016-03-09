#!/bin/bash
scp -r */ chemreac@hera:~/chemreac_anaconda/
for DIR in */; do
    ssh chemreac@hera "source /etc/profile; CONDA_PY=27 conda-build ~/chemreac_anaconda/$DIR"
    ssh chemreac@hera "source /etc/profile; CONDA_PY=34 conda-build ~/chemreac_anaconda/$DIR"
done
