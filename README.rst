Conda recipes for chemreac
==========================
See https://conda.anaconda.org/chemreac

How to build the recipes
------------------------

::

   $ ./build_all.sh

And that's it, the packages are then uploaded manually from ``./opt/conda-bld/linux-64`` using ``anaconda upload``.
Note that ~10GB of free diskspace is needed. (a new dir ./opt will be created)

Building the dockerimage
------------------------

::

   $ docker build -t chemreac/chemreac_anaconda environment/

