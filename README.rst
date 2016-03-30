Conda recipes for chemreac
==========================
See https://conda.anaconda.org/chemreac

How to build the recipes
------------------------

::

   $ ./build_all.sh

And that's it, the packages are then uploaded manually from ``./output/`` using ``anaconda upload``.

Building the dockerimage
------------------------

::

   $ docker build -t chemreac/chemreac_anaconda environment/

