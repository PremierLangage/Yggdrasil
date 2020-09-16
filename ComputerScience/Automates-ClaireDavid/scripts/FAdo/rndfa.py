# -*- coding: utf-8 -*-
"""**Random DFA generation**

ICDFA Random generation binding

.. *Authors:* Rogério Reis & Nelma Moreira

.. *This is part of FAdo project*  http://fado.dcc.fc.up.pt

.. *Version:* 0.9.8

.. *Copyright:* 1999-2013 Rogério Reis & Nelma Moreira {rvr,nam}@dcc.fc.up.pt

.. versionchanged:: 0.9.4 Interface python to the C code

.. versionchanged:: 0.9.6 Working with incomplete automata

.. versionchanged:: 0.9.8 distinct classes for complete and incomplete ICDFA

.. Contributions by
  - Marco Almeida

..  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA."""

from . import generator
from . import fa
from .common import *


class ICDFArgen(object):
    """Generic ICDFA random generator class

    .. note::
        This is an abstract class, not to be used directly

    .. seealso:: Marco Almeida, Nelma Moreira, and Rogério Reis. Enumeration and generation with a string automata
       representation. Theoretical Computer Science, 387(2):93-102, 2007"""
    def next(self):
        """Get the next generated DFA

        :returns: a random generated ICDFA
        :rtype: DFA"""
        a = self.gen.next()
        return fa.stringToDFA(a[0], a[1], self.n, self.k)

    def __next__(self):
        return self.next()


class ICDFArnd(ICDFArgen):
    """ Complete ICDFA random generator class

    This is the class for the uniform random generator for Initially Connected DFAs

    :var int n: number of states
    :var int k: size of the alphabet
    :var int seed: seed for the random generator (if 0 uses time as seed)

    .. attention::
        At the momment, if two generators are `simultaneous' used, and seed where provided, the repeatable aspect
        of the generated sequences is *not* waranted. To achieve that beahaviour use one generator at a time.

    .. versionchanged:: 1.3.4 seed added to the random generator"""

    def __init__(self, n, k, seed=0):
        self.gen = generator.icdfaRndGen(n, k, 0, 0, seed)
        self.n, self.k = n, k
        self.seed = seed

    def __str__(self):
        return "ICDFArnd %d %d %d" % (self.n, self.k, self.seed)


class ICDFArndIncomplete(ICDFArgen):
    """ Incomplete ICDFA random generator class

    :var int n: number of states
    :var int k: size of alphabet
    :var float bias: how often must the gost sink state appear (default None)
    :var int seed: seed for the random generator (if 0 uses time as seed)

    :raises IllegalBias: if a bias >=1 or <=0 is provided

    .. versionchanged:: 1.3.4 seed added to the random generator"""
    def __init__(self, n, k, bias=None, seed=0):
        self.seed = seed
        if bias is None:
            self.gen = generator.icdfaRndGen(n, k, 1, 1, seed)
        elif bias <= 0 or bias >= 1:
            raise IllegalBias()
        else:
            m = int((bias * n) / (1 - bias))
            self.gen = generator.icdfaRndGen(n, k, 1, m, seed)
        self.n, self.k, self.bias = n, k, bias

    def __str__(self):
        return "ICDFArndIncomplete %d %d %d"%(self.n, self.k, self.bias, self.seed)
