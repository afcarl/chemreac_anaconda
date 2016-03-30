#!/bin/bash
#
#  $ ./build_recipe.sh ./recipes/ ./output/ "conda build ./recipes/10_non-python/10_openblas" pyth2.7_nump1.10

BASE_PATH=$(unset CDPATH && cd "$(dirname $0)" && echo $PWD)
ABS_RECIPES_PATH=$(unset CDPATH && cd "$1" && echo $PWD)
DOCKERIMAGE=chemreac/chemreac_anaconda


if [[ ! -d opt ]]; then
    mkdir opt
    cat <<EOF | docker run --rm -v $BASE_PATH/opt:/new_opt -i $DOCKERIMAGE bash -x
cp -r /opt/conda /new_opt/
EOF
fi

cat <<'EOF' | docker run --rm -e RUNCMD="$3" -e CURENV="$4" -e TERM -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) -v $ABS_RECIPES_PATH:/root/recipes -v $BASE_PATH/opt:/opt -w /root ${@:5} -i $DOCKERIMAGE bash -x
echo "channels:" >>/root/.condarc
echo " - defaults" >>/root/.condarc
echo " - chemreac" >>/root/.condarc
echo "show_channel_urls: true" >>/root/.condarc
export PATH=/opt/conda/bin:$PATH
ls /opt/conda
if [[ "$CURENV" != "" ]]; then
    source activate ${CURENV}_
fi
$RUNCMD
addgroup --gid "$HOST_GID" mygroup
adduser --disabled-password --uid "$HOST_UID" --gid "$HOST_GID" --gecos '' myuser
chown "$HOST_UID":"$HOST_GID" -R /root/conda-envs
EOF
