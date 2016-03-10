#!/bin/bash
#
#  $ ./build_recipe.sh ./recipes/ ./output/ "conda build ./input/10_non-python/10_openblas" py27

ABS_INPUT_PATH=$(unset CDPATH && cd "$1" && echo $PWD)
ABS_ENV_PATH=$(unset CDPATH && cd "$2" && echo $PWD)
CURENV=${4:-py27}
DOCKERIMAGE=chemreac/chemreac_anaconda

cat <<'EOF' | docker run --rm -e RUNCMD="$3" -e TERM -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) -v $ABS_INPUT_PATH:/root/input -v $ABS_ENV_PATH:/root/conda-envs -w /root ${@:5} -i $DOCKERIMAGE bash -x
if [[ -e /root/conda-envs/conda-bld ]]; then
    cp -rau /root/conda-envs/conda-bld/. /opt/conda/conda-bld/.
fi
if [[ ! -e /root/conda-envs/$CURENV ]]; then
    conda create --prefix /root/conda-envs/$CURENV --clone ${CURENV}_
fi
source activate /root/conda-envs/$CURENV
$RUNCMD
cp -rau /opt/conda/conda-bld/ /root/conda-envs
addgroup --gid "$HOST_GID" mygroup
adduser --disabled-password --uid "$HOST_UID" --gid "$HOST_GID" --gecos '' myuser
chown "$HOST_UID":"$HOST_GID" -R /root/conda-envs
EOF
