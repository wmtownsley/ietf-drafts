#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- Python -*-
#
# $Id: fix-artwork.py $
#
# Author: Markus Stenberg <markus stenberg@iki.fi>
#
# Copyright (c) 2014 cisco Systems, Inc.
#
# Created:       Wed Feb  5 08:44:50 2014 mstenber
# Last modified: Wed Feb  5 08:47:45 2014 mstenber
# Edit time:     3 min
#
"""

This is a minimalist script which fixes artwork after reindent of XML draft. The basic idea is to left-justify all of it (=get rid of all whitespace before it).

Assumptions:
</?artwork> tags are on their own lines

"""

import sys, re

artwork_re = re.compile('<artwork>').search
no_artwork_re = re.compile('</artwork>').search

in_artwork = False
for line in sys.stdin:
    if in_artwork:
        if no_artwork_re(line):
            in_artwork = False
        else:
            print line.strip()
            continue
    elif artwork_re(line):
        in_artwork = True
    print line,

