Conda recipes for chemreac
==========================
This is a build script for building conda packages for `chemreac <https://github.com/chemreac/chemreac>`_.
It uses the `conda_builder_linux image provided by ContinuumIO <https://github.com/ContinuumIO/docker-images/tree/master/conda_builder_linux>`_.

Published packages: https://conda.anaconda.org/chemreac

How to build the recipes
------------------------
If ``start_cpp98.sh`` is in your ``$PATH`` (see ``conda_builder_linux`` above):

::

   $ git clone git://github.com/chemreac/chemreac_anaconda.git
   $ cd chemreac_anaconda
   $ start_cpp98.sh -v $(pwd):/home/dev/chemreac_anaconda ./chemreac_anaconda/build_push.sh


And that is it. You need to modify ``clone_build_push.sh`` to your needs (server addresses etc.)
