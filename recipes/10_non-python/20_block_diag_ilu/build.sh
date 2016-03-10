#!/bin/bash
export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include
export CPLUS_INCLUDE_PATH=$PREFIX/include
${PYTHON} setup.py build
${PYTHON} setup.py install
