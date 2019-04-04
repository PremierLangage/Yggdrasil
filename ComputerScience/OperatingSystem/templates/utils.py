#!/usr/bin/env python3
# coding: utf-8

#*****************************************************************************
#       Copyright (C) 2019 Nicolas Borie <nicolas dot borie at u-pem . fr>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    General Public License for more details.
#
#  The full text of the GPL is available at:
#
#                  http://www.gnu.org/licenses/
#*****************************************************************************

import random

"""
This module utils.py implement some miscellaneous functionalities for 
exercices generation.

`subset_index` return a combination of `p` elements out of `n`. It returns
a random subset of integers of size `p` out of the set `{0, 1, ..., n-1}`.
The returned subset is always sorted. The generation follow the uniform law
on all combination.

`knuth_mixing` mixes in place a Python list in argument. The function just
apply some random swap over well chosen pairs of elements. The list is 
modifyed has a uniform random permutation has been applied on the content 
with action by position.
"""

def subset_index(n, p):
    """
    Returns a random subset of `{0, ..., n-1}` of size `p`

    EXAMPLES::

    >>> len(set(subset_index(5, 3)) == 3
    True
    >>> len(set(subset_index(10, 6)) == 6
    True
    """
    lst = []
    while (n >= p and p > 0):
        if random.randint(1, n) <= p:
            lst.append(n-1)
            p = p-1
        n = n-1
    return lst


def knuth_mixing(lst):
    """
    Mix in place elements of the list `lst` in argument.

    EXAMPLES::

    >>> sorted(knuth_mixing(list(range(10)))) == list(range(10))
    True
    """
    for i in range(len(lst)-1, 0, -1):
        j = random.randint(0, i)
        if j != i:
            lst[i], lst[j] = lst[j], lst[i]
    return lst

