#!/bin/bash
conda install --yes -c chemreac chemreac pytest

# http://stackoverflow.com/questions/36041964/messed-up-numpy-installation-gfortran-1-4-not-found-bug
# https://github.com/ContinuumIO/anaconda-issues/issues/686
conda remove --yes libgfortran
conda install --yes libgcc --force

MPLBACKEND=Agg py.test --pyargs chemreac
