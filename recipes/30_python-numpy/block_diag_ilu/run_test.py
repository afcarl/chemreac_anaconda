#!/usr/bin/env python
# -*- coding: utf-8 -*-

import io
import os
from block_diag_ilu import get_include
assert os.listdir(get_include())[0] == 'block_diag_ilu.hpp'
path = os.path.join(get_include(), 'block_diag_ilu.hpp')
assert io.open(path, 'rt', encoding='utf-8').readline().startswith('#pragma once')
