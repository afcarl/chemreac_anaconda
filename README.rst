Conda recipes for chemreac
==========================
This is repo collects build scripts for building conda packages for `chemreac <https://github.com/chemreac/chemreac>`_.
It uses the `conda_builder_linux<https://github.com/ContinuumIO/docker-images/tree/master/conda_builder_linux>`_  image provided by ContinuumIO.

Published packages: https://conda.anaconda.org/chemreac

How to build the recipes
------------------------
If ``start_cpp98.sh`` is in your ``$PATH`` (see ``conda_builder_linux`` above):

::

   $ git clone git://github.com/chemreac/chemreac_anaconda.git
   $ cd chemreac_anaconda
   $ start_cpp98.sh ./orchestrate_all.sh


here is an example how I build lapack on my workstation:

::

   $ PATH=~/vc/docker-images/conda_builder_linux:$PATH ./orchestrate_all.sh recipes/10_non-python/10_lapack/


And that is it. Built packages are then found under ``./opt/miniconda/conda-bld/linux-64`` which may then be
uploaded manually to anaconda.org using the anaconda tool.

Note that the ``./opt`` dir may grow quite large over time, and you will need to remove it if there has
been a new docker image published by ContinuumIO in between your builds.
