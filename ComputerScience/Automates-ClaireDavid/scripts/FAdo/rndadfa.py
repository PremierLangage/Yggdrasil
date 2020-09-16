# -*- coding: utf-8 -*-
"""**Random ADFA generation**

ADFA Random generation binding

.. *Authors:* Rogério Reis & Nelma Moreira

.. *This is part of FAdo project*  http://fado.dcc.fc.up.pt

.. *Copyright:* 1999-2015 Rogério Reis & Nelma Moreira {rvr,nam}@dcc.fc.up.pt

.. versionadded:: 1.2.1

.. This program is free software; you can redistribute it and/or modify
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

from fa import stringToDFA, DFA

from random import randint


class ADFArnd():
    """ Sets a random generator for Adfas by sources. By default,  s=1 to be initially connected
    
    :var int n: number of states
    :var int k: size of the alphabet
    :var int s: number of sources

    .. note::
       For ICDFA  s=1"""

    def __init__(self, n, k=2, s=1):
        assert n > 0 and n >= s
        self.n = n
        self.k = k
        self.s = s
        self.c_beta = {}
        self.c_alpha = {}
        self.c_gamma = {}

    def next(self):
        """ Generates a random adfa

        :returns: an dfa if number of sources is 1; otherwise self.transitions has the transitions of an adfa
                  with s sources
        :rtype: DFA"""
        if "transitions" in dir(self):
            del self.transitions
        self.rndAdfa(self.n, self.s)
        if self.s == 1:
            finals = [randint(0, 1) for i in range(self.n)]
            adfa = stringToDFA(self.transitions, finals, self.n, self.k)
            adfa.setInitial(self.n - 1)
            return adfa

    def __next__(self):
        return self.next()

    def __str__(self):
        return "ADFArnd %d %d %d" % (self.n, self.k, self.s)

    def rndNumberSecondSources(self, n, s):
        """Uniformaly random generates the number of secondary sources

        :arg int n: number of states
        :arg int s: number of sources
        :rtype: int"""
        if n == s:
            return 0
        d = randint(1, self.alpha(n, s, self.k))
        u = 0
        while d > 0:
            u += 1
            d -= binomial(n, s) * self.gamma(self.k * s, u, n - s - u) * self.alpha(n - s, u, self.k)
        return u

    def rndTransitionsFromSources(self, n, s, u):
        """Generates the transitions from the sources, ensuring that all secondary sources are connected

        :arg n: number of states
        :arg s: number of sources
        :arg u: number of secondary sources 
        :type n: int
        :type s: int
        :type u: int"""
        r = n - s - u
        u0 = 0
        t = self.k * s
        while t != 0:
            if u > 0 and randint(1, self.gamma(t, u, r)) <= u * self.gamma(t - 1, u - 1, r):
                self.transitions.append(u0 + r)
                assert u0 + r <= len(self.transitions) / self.k
                u0 += 1
                u -= 1
            else:
                q = randint(0, u + r)
                if q == u + r:
                    self.transitions.append(-1)
                else:
                    if q < r:
                        self.transitions.append(q)
                        assert q <= len(self.transitions) / self.k
                    else:
                        self.transitions.append(u0 + q)
                        assert u0 + q <= len(self.transitions) / self.k
            t -= 1

    def rndAdfa(self, n, s):
        """ Recursively generates a initially connected adfa

        :arg n: number of states
        :arg s: number of sources
        :type n: int
        :type s: int

        .. seealso:: Felice & Nicaud, CSR 2013 Lncs 7913, pp 88-99, Random Generation of Deterministic Acyclic Automata
           Using the Recursive Method, DOI:10.1007/978-3-642-38536-0_8"""
        if n == s:
            self.transitions = [-1] * (self.k * s)
            return
        u = self.rndNumberSecondSources(n, s)
        self.rndAdfa(n - s, u)
        self.rndTransitionsFromSources(n, s, u)

    def countAdfaBySources(self, n, s, k=2):
        """ Number of labelled (initially connected)  acyclic automata with n states, alphabet size k, and s sources

        :arg k: alphabet size
        :arg n: number of states
        :arg s: number of souces
        :type k: int
        :type n: int
        :type s: int
        :raises IndexError: if number of states less than number of sources"""
        if s > n:
            raise IndexError(s)
        if n == s:
            return 1
        if (n, s, k) not in self.c_alpha:
            su = 0
            d = -1
            for i in range(n - s + 1):
                d *= -1
                su += binomial(n - s, i) * ((n - s - i + 1) ** (k * (s + i))) * countafaL(n - s - i, k) * d
            self.c_alpha[(n, s, k)] = binomial(n, s) * su
        return self.c_alpha[(n, s, k)]

    def beta(self, n, s, u, k=2):
        """ Number of valid configurations of transitions

        :arg k: alphabet size
        :arg n: number of states
        :arg s: number of souces
        :arg u: number of souces of n-s
        :type k: int
        :type n: int
        :type s: int
        :type u: int
        :rtype: int

        .. note:: not used by alpha or rndAdfa"""
        if s > n or u > n - s:
            raise IndexError(s)
        if (n, s, u, k) not in self.c_beta:
            self.c_beta[(n, s, u, k)] = sum(
                [binomial(k * s, i) * surj(i, u) * ((n - s - u + 1) ** (k * s - i)) for i in range(u, k * s + 1)])
        return self.c_beta[(n, s, u, k)]

    def alpha(self, n, s, k=2):
        """ Number of labeled acyclic initially connected DFA by states and by sources

        :arg k: alphabet size
        :arg n: number of states
        :arg s: number of souces
        :type k: int
        :type n: int
        :type s: int
        :rtype: int

        .. note:: uses countAdfabySource """
        return self.countAdfaBySources(n, s, k)

    def alpha0(self, n, s, k=2):
        """ Number of labeled acyclic initially connected DFA by states and by sources

        :arg k: alphabet size
        :arg n: number of states
        :arg s: number of souces
        :type k: int
        :type n: int
        :type s: int
        :rtype: int

        .. note:: uses gamma instead of beta or rndAdfa"""
        if s > n:
            raise IndexError(s)
        if n == s:
            return 1
        if (n, s, k) not in self.c_alpha:
            self.c_alpha[(n, s, k)] = binomial(n, s) * sum(
                [self.gamma(k * s, u, n - s - u) * self.alpha(n - s, u, k) for u in range(1, min(k * s, n - s) + 1)])
        return self.c_alpha[(n, s, k)]

    def gamma(self, t, u, r):
        """

        :arg t: size of T
        :arg u: size of U
        :arg r: size of R
        :type t: int
        :type u: int
        :type r: int
        :rtype: int"""
        if t < 0:
            raise IndexError(t)
        if u == 0:
            return (r + 1) ** t
        if t < u:
            return 0
        if (t, u, r) not in self.c_gamma:
            self.c_gamma[(t, u, r)] = u * self.gamma(t - 1, u - 1, r) + (r + u + 1) * self.gamma(t - 1, u, r)
        return self.c_gamma[(t, u, r)]

    def beta0(self, n, s, u, k=2):
        """ Function beta computed using sets"""
        if s > n or u > n - s:
            raise IndexError(s)
        return self.gamma(k * s, u, n - s - u)

# #### Combinatorial functions:

bino = {}

c_surj = {}


def binomial(n, k):
    """Binomial coeficient

    :arg n: n
    :arg k: k"""
    if n < 0 or k < 0 or n < k:
        return 0
    if k == 0 or k == n:
        return 1
    if (n, k) not in bino:
        bino[(n, k)] = reduce(lambda x, y: x * y, [n - i for i in range(k)]) / reduce(lambda x, y: x * y,
                        [i for i in range(1, k + 1)])
    return bino[(n, k)]


def surj(n, m):
    """ Counting surgections from [n] to [m]

        :arg n: cardinality of domain
        :arg m: cardinality of image
        :type n: int
        :type m: int
        
        .. note:: not used by rndAdfa"""
    if m > n:
        return 0
    if m == 1:
        return 1
    if (n, m) not in c_surj:
        c_surj[(n, m)] = m * surj(n - 1, m - 1) + m * surj(n - 1, m)
    return c_surj[(n, m)]

# Liskovets formulas
c_afa = {}

c_adfa = {}


def countafaL(n, k, r=1):
    """ (Quasi) Acyclic deterministic finite automata  structure (labeled)  

    :arg n: number of states
    :arg k: alphabetic size
    :arg r: number of dead states
    :type n: int
    :type k: int
    :type r: int

    .. seealso::
       V. A. Liskovets. Exact enumeration of acyclic deterministic automata. Discrete Applied Mathematics, 154(3):537-551, March 2006."""
    if n == 0:
        return 1
    if (n, k) not in c_afa:
        c_afa[(n, k)] = sum(
            [((-1) ** (n - j - 1)) * binomial(n, j) * ((j + r) ** (k * (n - j))) * countafaL(j, k) for j in range(n)])
    return c_afa[(n, k)]


def countafa(n, k):
    """  (Quasi) Acyclic deterministic finite automata structure (unlabeled)  """
    return countafaL(n, k) / reduce(lambda x, y: x * y, range(1, n))


def countadfaL(n, k):
    """ Acyclic (complete) deterministic finite automata  structure (labeled)  initially connected (one dead state)

    :arg n: number of states
    :arg k: alphabetic size
    :type n: int
    :type k: int

    .. see also::
       V. A. Liskovets. Exact enumeration of acyclic deterministic automata.
       Discrete Applied Mathematics, 154(3):537-551, March 2006.
    """
    if n == 1:
        return 1
    if (n, k) not in c_adfa:
        c_adfa[(n, k)] = sum(
            [((-1) ** (n - j)) * binomial(n - 1, j - 1) * ((j + 1) ** (k * (n - j))) * countafaL(j, k, 1) for j in
             range(1, n + 1)])
    return c_adfa[(n, k)]


def countadfa(n, k):
    """  Acyclic (complete) deterministic finite automata  structure (unlabeled)

    :arg n: number of states
    :arg k: alphabetic size
    :type n: int
    :type k: int"""
    return countadfaL(n, k) / reduce(lambda x, y: x * y, range(1, n))


def tab_adfa(n1, n2, k1, k2):
    for k in range(k1, k2 + 1):
        print "k=%d" % k
        for n in range(n1, n2 + 1):
            print "n=%d\t %s" % (n, countadfa(n, k) * 2 ** n)
