#! /usr/bin/env /bin/bash
#  extract_exports.sh
#  Copyright (c) 2021-2026, Pedro Luis Castedo Cepeda
#  SPDX-License-Identifier: BSD-3-Clause 

echo -e 'LIBRARY sofa\nEXPORTS' >libsofa.def
cat "$1" | sed -nE "s/^.+\s(iau.+)\(.*$/    \\1/p" >>libsofa.def
