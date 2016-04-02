#!/bin/bash
conda install -c chemreac chemreac pytest
py.test --pyargs chemreac
