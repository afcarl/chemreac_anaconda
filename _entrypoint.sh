#!/bin/bash -x
echo "show_channel_urls: true" >>~/.condarc
cd $(dirname $0)
./_build_all.sh $@

