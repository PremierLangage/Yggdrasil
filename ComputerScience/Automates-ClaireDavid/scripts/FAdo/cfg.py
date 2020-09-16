# -*- coding: utf-8 -*-
"""**Context Free Grammars Manipulation.**

Basic context-free grammars manipulation for building uniform random generetors

.. *Authors:* Rogério Reis & Nelma Moreira

.. *This is part of FAdo project* http://fado.dcc.fc.up.pt

.. *Copyright:* 1999-2014 Rogério Reis & Nelma Moreira {rvr,nam}@dcc.fc.up.pt


.. This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as published
   by the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
   for more details.

   You should have received a copy of the GNU General Public License along
   with this program; if not, write to the Free Software Foundation, Inc.,
   675 Mass Ave, Cambridge, MA 02139, USA."""

#__package__ = "FAdo"

import re
import string
from random import randint
from . import common

class CFGrammar(object):
    """ Class for context-free grammars

     :var Rules: grammar rules
     :var Terminals: terminals symbols
     :var Nonterminals: nonterminals symbols
     :var str Start: start symbol
     :var ntr: dictionary of rules for each nonterminal"""

    def __init__(self, gram):
        """Initialization

            :param gram: is a list for productions; each production is a tuple (LeftHandside, RightHandside) with
                LeftHandside nonterminal, RightHandside list of symbols, First production is for start symbol

        """
        self.Rules = gram
        self.Nonterminals = {r[0] for r in self.Rules}
        self.Terminals = set()
        for r in self.Rules:
            if isinstance(r[1], str):
                if r[1] not in self.Nonterminals:
                    self.Terminals.add(r[1])
            else:
                for s in r[1]:
                    if s not in self.Nonterminals:
                        self.Terminals.add(s)
        self.Start = self.Rules[0][0]
        self.Nullable = {}
        self.tr = {}
        self.ntr = {}
        for i in xrange(len(self.Rules)):
            if self.Rules[i][0] not in self.ntr:
                self.ntr[self.Rules[i][0]] = {i}
            else:
                self.ntr[self.Rules[i][0]].add(i)

    def __str__(self):
        """Grammar rules

        :return: a string representing the grammar rules"""
        s = ""
        for n in xrange(len(self.Rules)):
            lhs = self.Rules[n][0]
            rhs = self.Rules[n][1]
            if not isinstance(rhs, str) and len(rhs) > 1:
                rhs = string.join(rhs)
            s += "{0:d} | {1:s} -> {2:s} \n".format(n, lhs, rhs)
        return "Grammar Rules:\n\n%s" % s

    def maketerminals(self):
        """Extracts C{terminals} from the rules. Nonterminals must already exist"""
        self.Terminals = set()
        for r in self.Rules:
            if isinstance(r[1], str):
                if r[1] not in self.Nonterminals:
                    self.Terminals.add(r[1])
            else:
                for s in r[1]:
                    if s not in self.Nonterminals:
                        self.Terminals.add(s)

    def makenonterminals(self):
        """Extracts C{nonterminals}  from grammar rules."""
        for r in self.Rules:
            self.Nonterminals.add(r[0])

    def terminalrules(self):
        self.tr = {}
        for a in self.Terminals:
            for i in xrange(len(self.Rules)):
                if self.Rules[i][1] == a:
                    if a not in self.tr:
                        self.tr[a] = {i}
                    else:
                        self.tr[a].add(i)

    def nonterminalrules(self):
        self.ntr = {}
        for i in xrange(len(self.Rules)):
            if self.Rules[i][0] not in self.ntr:
                self.ntr[self.Rules[i][0]] = {i}
            else:
                self.ntr[self.Rules[i][0]].add(i)

    def NULLABLE(self):
        """Determines which nonterminals X ->* [] """
        self.Nullable = {}
        for s in self.Terminals:
            self.Nullable[s] = 0
        for s in self.Nonterminals:
            self.Nullable[s] = 0
            if s in self.ntr:
                for i in self.ntr[s]:
                    if not self.Rules[i][1]:
                        self.Nullable[s] = 1
                        break
        k = 1
        while k == 1:
            k = 0
            for r in self.Rules:
                e = 0
                for i in r[1]:
                    if not self.Nullable[i]:
                        e = 1
                        break
                if e == 0 and not self.Nullable[r[0]]:
                    self.Nullable[r[0]] = 1
                    k = 1


class CNF(CFGrammar):
    """No useless nonterminals or epsilon rules are ALLOWED... Given a CFG grammar description generates one in CNF
      Then its possible to random generate words of a given size. Before some pre-calculations are nedded."""

    def __init__(self, gram, mark="A@"):
       # super(CNF, self).__init__(gram)
        CFGrammar.__init__(self, gram)
        self.mark = mark
        self.newnt = 0
        self.nttr = {}
        self.unitary = self.get_unitary()
        self.Chomsky()

    def get_unitary(self):
        return set([r for r in self.Rules if
                    (isinstance(r[1], str) and
                     r[1] in self.Nonterminals) or
                    (len(r[1]) == 1 and r[1][0] in self.Nonterminals)])

    def elim_unitary(self):
        """Elimination of unitary rules """
        f = 1
        while f:
            f = 0
            self.unitary = self.get_unitary()

            for u in self.unitary:
                if isinstance(u[1], str):
                    ui = u[1]
                else:
                    ui = u[1][0]
                if ui in self.ntr:
                    for i in self.ntr[ui]:
                        if (u[0], self.Rules[i][1]) not in self.Rules:
                            f = 1
                            self.Rules.append((u[0], self.Rules[i][1]))
                            self.ntr[u[0]].add(len(self.Rules) - 1)

        for u in self.unitary:
            self.Rules.remove(u)

    def get_ntr_tr(self, a):
        nta = self.mark + a
        self.Nonterminals.add(nta)
        self.Rules.append((nta, a))
        return nta

    def iter_rule(self, lhs, rhs, i):
        if not isinstance(rhs, str) and len(rhs) == 2:
            self.Rules[i] = (lhs, rhs)
            return
        nta = self.mark + "_" + str(self.newnt)
        self.Nonterminals.add(nta)
        self.newnt += 1
        self.Rules.append((lhs, (rhs[0], nta)))
        self.iter_rule(nta, rhs[1:], i)

    def Chomsky(self):
        """ Transform to CNF """
        self.elim_unitary()
        self.nttr = {}
        # terminal a is replaced by A@_a in all rules > 2
        for a in self.Terminals:
            for i in xrange(len(self.Rules)):
                if not isinstance(self.Rules[i][1], str) and len(self.Rules[i][1]) >= 2 and a in self.Rules[i][1]:
                    if a not in self.nttr:
                        self.nttr[a] = self.get_ntr_tr(a)
                    rr = list(self.Rules[i][1])
                    for k in xrange(len(rr)):
                        if rr[k] == a:
                            rr[k] = self.nttr[a]
                    self.Rules[i] = (self.Rules[i][0], tuple(rr))
        n = len(self.Rules)
        for i in xrange(n):
            if not isinstance(self.Rules[i][1], str) and len(self.Rules[i][1]) > 2:
                self.iter_rule(self.Rules[i][0], self.Rules[i][1], i)


class cfgGenerator(object):
    """CFG uniform genetaror """
    def __init__(self, cfgr, size):
        """Object initialization
            :param cfgr: grammar for the random objects
            :type cfgr: CNF
            :param size: size of objects
            :type size: integer"""
        self.grammar = cfgr
        self.size = size
 #       self.density = {}
 #       self.density_r = {}
        self._eval_densities(size)

    def generate(self):
        """Generates a new random object generated from the start symbol

            :returns: object
            :rtype: string"""
        return self._gen(self.grammar.Start, self.size)

    def _gen(self, nt, n):
        """Generates a new random object generated from the nonterminal

        :param str nt: nonterminal
        :param int n: object size
        :returns: object
        :rtype: str"""
        g = self.grammar
        if n in self.density[nt] and self.density[nt][n] > 0:
            u = randint(1, self.density[nt][n])
            r = 1
            if n == 1:
                for i in g.ntr[nt]:
                    if g.Rules[i][1] in g.Terminals:
                        r += 1
                        if r > u:
                            ic = i
                            break
                try:
                    return g.Rules[ic][1]
                except KeyError:
                    raise KeyError
            for i in g.ntr[nt]:
                if len(g.Rules[i][1]) == 2:
                    if n in self.density_r[i]:
                        r += self.density_r[i][n]
                        if r > u:
                            ic = i
                            break
            uk = randint(1, self.density_r[ic][n])
            rk = 1
            for k in xrange(1, n):
                if (k in self.density[g.Rules[ic][1][0]] and self.density[g.Rules[ic][1][0]][k] > 0 and
                            n - k in self.density[g.Rules[ic][1][1]] and self.density[g.Rules[ic][1][1]][
                        n - k] > 0):
                    rk += self.density[g.Rules[ic][1][0]][k] * self.density[g.Rules[ic][1][1]][n - k]
                    if rk > uk:
                        kk = k
                        break
            return self._gen(g.Rules[ic][1][0], kk) + self._gen(g.Rules[ic][1][1], n - kk)

    def _eval_densities(self, n):
        """Evaluates densities

        :param int n: object size"""
        g = self.grammar
        self.density = {}
        self.density_r = {}
        for nt in g.Nonterminals:
            self.density[nt] = {}
            self.density[nt][1] = 0
        g.terminalrules()
        g.nonterminalrules()
        for t in g.tr:
            for i in g.tr[t]:
                self.density[g.Rules[i][0]][1] += 1
        for l in xrange(2, n + 1):
            for nt in g.ntr:
                r = 0
                for i in g.ntr[nt]:
                    if len(g.Rules[i][1]) == 2:
                        if i not in self.density_r:
                            self.density_r[i] = {}
                        self.density_r[i][l] = sum(
                            [self.density[g.Rules[i][1][0]][k] * self.density[g.Rules[i][1][1]][l - k] for k in
                             xrange(1, l) if
                             k in self.density[g.Rules[i][1][0]] and l - k in self.density[g.Rules[i][1][1]]])
                        r += self.density_r[i][l]
                if r:
                    self.density[nt][l] = r


class reStringRGenerator(cfgGenerator):
    """Uniform random Generator for reStrings"""

    def __init__(self, Sigma=None, size=10, cfgr=None, epsilon=None, empty=None, ident="Ti"):
        """ Uniform random generator for regular expressions. Used without arguments generates an uncollapsible re
                over {a,b} with size 10. For generate an arbitary re over an alphabet of 10 symbols of size 100:
                reStringRGenerator (smallAlphabet(10),100,reGrammar["g_regular_base"])

        :param list|set Sigma: re alphabet (that will be the set of grammar terminals)
        :param int size: word size
        :param cfgr: base grammar
        :param epsilon: if not None is added to a grammar terminals
        :param empty: if not None is added to a grammar terminals

        .. note::
           the grammar can have already this symbols"""
        if cfgr is None:
            self.base = gRules(reGrammar["g_regular_uncollaps"])
        else:
            self.base = gRules(cfgr)
        if Sigma is None:
            self.Sigma = ["a", "b"]
        else:
            self.Sigma = Sigma
        for i in self.Sigma:
            self.base.append((ident, i))
        if epsilon is not None:
            self.base.append((ident, common.Epsilon))
        if empty is not None:
            self.base.append((ident, common.EmptySet))
        super(reStringRGenerator, self).__init__(CNF(self.base),size)


#noinspection PyUnusedLocal
def CYKParserTable(gramm, word):
    """Evaluates CYK parser table

      :param CNF gramm: grammar
      :param str word: word to be parsed
      :returns: the CYK table
      :rtype: list of lists of symbols"""
    pass


def gRules(rules_list, rulesym="->", rhssep=None, rulesep='|'):
    """Transforms a list of rules into  a grammar description.

      :param rules_list: is a list of rule where rule is a string  of the form: Word rulesym Word1 ... Word2 or  Word
          rulesym []
      :param rulesym: LHS and RHS rule separator
      :param rhssep: RHS values separator (None for white chars)
      :return: a grammar description """
    gr = []
    sep = re.compile(rulesym)
    #rsep = re.compile(rulesep)
    for r in rules_list:
        if isinstance(r, str):
            rule = r
        else:
            rule = r[0]
        m = sep.search(rule)
        if not m:
            continue
        else:
            if m.start() == 0:
                raise common.CFGgrammarError(rule)
            else:
                lhs = rule[0:m.start()].strip()
            if m.end() == len(rule):
                raise common.CFGgrammarError(rule)
            else:
                rest = string.strip(rule[m.end():])
                if rest == "[]":
                    rhs = []
                else:
                    multi = string.split(rest, rulesep)
                    rhs = []
                    for i in multi:
                        l = string.split(i, rhssep)
                        if len(l) > 1:
                            l = tuple(string.split(i, rhssep))
                        else:
                            l = l[0]
                        gr.append((lhs, l))
    return gr

def smallAlphabet(k, sigma_base="a"):
    """Easy way to have small alphabets

      :param k: alphabet size (must be less than 52)
      :param sigma_base: initial symbol
      :returns: alphabet
      :rtype: list"""
    Sigma = []
    if k >= 52:
        raise common.CFGterminalError(k)
    lim = min(26, k)
    for i in xrange(lim):
        Sigma.append(chr(ord(sigma_base) + i))
    if k >= 26:
        sigma_base = 'A'
        for i in xrange(k - lim):
            Sigma.append(chr(ord(sigma_base) + i))
    return Sigma

reGrammar = {'g_regular_base': ["Tr -> Tr + Tc | Tc", "Tc -> Tc Ts |  Ts",
                                "Ts -> Ts * | Ti | ( Tr ) "],
             'g_finite_base': ["Tr -> Tr + Tc | Tc", "Tc -> Tc Ts |  Ts",
                                "Ts ->  Ti | ( Tr ) "],
             'g_regular_wredund': ["Tr -> Trs | Tf ", "Trs -> Trs + Tf | Tf + Tf",
                                   "Tf -> Tc | Te | Ti",
                                   "Tc -> Tc Ts |  Ts Ts",
                                   "Ts -> Te | Ti | ( Trs ) ",
                                   "Te -> ( Trs ) * | ( Tc ) * | Ti *"],
             'g_regular_uncollaps': ["Ts ->  Trs | Tcc  | Tee | Ti | {0:s} | {1:s}".format(common.Epsilon, common.EmptySet),
                                     "Tcc -> Tcc Tr | Tr Tr",
                                     "Tr -> ( Trs ) | Tee | Ti ",
                                     "Tee -> ( Trs ) * | ( Tcc ) * | Ti *",
                                     "Trs -> {0:s} + Tx | Ty + Tz".format(common.Epsilon),
                                     "Tx -> Tt | Tt + Tx",
                                     "Tt -> Tcc | Ti ",
                                     "Ty -> Tz | Ty + Tz",
                                     "Tz -> Tcc | Tee | Ti "],
             'g_pt': [" Tz -> Tz + Tf | Tf",
                      "Tf -> Tf {0:s}  Te | Te".format(common.Conj),
                      "Te -> {0:s} ( Ts ) | Ts ".format(common.Not),
                       "Ts -> Ts Tu | {0:s} Tu".format(common.SigmaS),
                      "Tu ->  Ti {0:s}".format(common.SigmaS)],
             'g_sha': ["Ts  -> Ted | Tec | Tes | Ti | {0:s}".format(common.Epsilon),
                       "Tec -> . Tec Tr | . Tr Tr ",
                       "Tr -> Ted | Tes | Ti",
                       "Tes -> * Ted | * Tec | * Ti",
                       "Ted -> + {0:s} Tx | + Ty Tz".format(common.Epsilon),
                       "Tx -> Tt | + Tt Tx",
                       "Tt -> Tec | Ti",
                       "Ty -> Tz | + Ty Tz",
                       "Tz -> Tec | Tes | Ti"],
             'g_rpn': ["Tx -> {0:s} | Ti | +  Tx  Tx  | . Tx Tx  | * Tx".format(common.Epsilon)],
             'g_rpn_finite': ["Tx -> {0:s} | Ti | +  Tx  Tx  | . Tx Tx".format(common.Epsilon)],
             'g_rpn_snf':["Tx ->  Tp | Tnp",
                    "Tp -> {0:s} | . Tp Tp | + Tp Tnp | + Tnp Tp | + Tp Tp |  * Tnp ".format(common.Epsilon),
                    "Tnp -> Ti | + Tnp Tnp | . Tp Tnp | . Tnp Tp | . Tnp Tnp"],
             'g_rpn_snf_uf': ["Tx ->  Tp | Tnp",
                           "Tp ->  . Tp Tp |   * Tnp ",
                           "Tnp -> Ti |  . Tp Tnp | . Tnp Tp | . Tnp Tnp"],
             'g_rpn_option':["Tp -> {0:s} | Tx ".format(common.Epsilon),
                 "Tx ->  Ti | +  Tx  Tx  | . Tx Tx  | * Tx| {0:s} Tx".format(common.Option)],
             'g_rpn_snf_option':["Tx -> {0:s} | Tp | Tnp".format(common.Epsilon),
                    "Tp -> . Tp Tp | + Tp Tnp | + Tnp Tp | + Tp Tp |* Tnp| {0:s} Tnp".format(common.Option),
                    "Tnp -> Ti | + Tnp Tnp | . Tp Tnp | . Tnp Tp | . Tnp Tnp"],
             'g_rpn_pi': [ "Tp -> Ti | +  Tp  Tx | + Tnp Tp | . Tx Tp | . Tp {0:s}".format(common.Epsilon),
                           "Tx -> {0:s} | Ti | +  Tx  Tx  | . Tx Tx  | * Tx".format(common.Epsilon),
                           "Tnp -> {0:s} | +  Tnp  Tnp | . Tnp Tnp | . Tp Tnp".format(common.Epsilon)],
             'grse_rpn': ["Tx -> {0:s} | Ti | +  Tx  Tx  | {1:s} Tx Tx | . Tx Tx  | * Tx".format(common.Epsilon, common.Shuffle)],
             'grs_rpn': ["Tx ->  Ti | +  Tx  Tx  | {0:s} Tx Tx | . Tx Tx  | * Tx".format(common.Shuffle)],
             'grf_rpn': ["Tx ->  Ti | +  Tx  Tx  | {0:s} Tx Tx | . Tx Tx ".format(common.Shuffle)],
             'grce_rpn': ["Tx -> {0:s} | Ti | +  Tx  Tx  | {1:s} Tx Tx | . Tx Tx  | * Tx".format(common.Epsilon, common.Conj)],
             'grc_rpn': ["Tx ->  Ti | +  Tx  Tx  | {0:s} Tx Tx | . Tx Tx  | * Tx".format(common.Conj)],
             'grcf_rpn': ["Tx ->  Ti | +  Tx  Tx  | {0:s} Tx Tx | . Tx Tx ".format(common.Conj)],
             'grcn_rpn': ["Tx ->  Ti | +  Tx  Tx  | {0:s} Tx Tx | . Tx Tx  | {1:s} Tx | * Tx".format(common.Conj, common.Not)],
             'grche_rpn': ["Ts -> {0:s} Tx Tx".format(common.Conj), "Tx ->  {0:s} |  Ti | +  Tx  Tx  | . Tx Tx  | * Tx".format(common.Epsilon)],
             'grcv_rpn': [ "Tn -> Ti | + Tn Tx | + Tv Tn | * Tn | . Tn Tx | . Tv Tn | {0:s} Tn Tn".format(common.Conj),
                           "Tv -> {0:s} | + Tv Tv | * Tv | . Tv Tv | {1:s} Tv Tx | {1:s} Tx Tv".format(common.Epsilon, common.Conj),
                          "Tx -> {0:s} | Ti | +  Tx  Tx  | {1:s} Tx Tx | . Tx Tx  | * Tx".format(common.Epsilon, common.Conj)],
             'gpt_rpn':  [" Tz ->  + Tz  Tf | Tf",
                      "Tf -> {0:s} Tf Te | Te".format(common.Conj),
                      "Te -> {0:s} Ts | Ts ".format(common.Not),
                       "Ts -> . Ts Tu | . {0:s} Tu".format(common.SigmaS),
                      "Tu ->  . Ti {0:s}".format(common.SigmaS)]
            }
