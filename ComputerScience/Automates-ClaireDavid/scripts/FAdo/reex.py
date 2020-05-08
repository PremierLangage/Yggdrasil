# -*- coding: utf-8 -*-
"""**Regular expressions manipulation**

Regular expression classes and manipulation

.. *Authors:* Rogério Reis & Nelma Moreira

.. Contributions by
    - Marco Almeida
    - Hugo Gouveia
    - Eva Maia
    - Rafaela Bastos

.. *This is part of FAdo project*   http://fado.dcc.fc.up.pt

.. *Version:* 0.9.8

.. *Copyright:* 1999-2013 Rogério Reis & Nelma Moreira {rvr,nam}@dcc.fc.up.pt


.. This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public
   License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any
   later version.

   This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
   details.


   You should have received a copy of the GNU General Public Licensealong with this program; if not, write to the
   Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA."""

from __future__ import print_function

from collections import deque
import copy

import fa
from common import *
from yappy_parser import *
from itertools import chain, combinations


class RegularExpression(object):
    """Abstract base class for all regular expression objects"""
    pass


class regexp(RegularExpression):
    """Base class for regular expressions.

    :var Sigma: alphabet set of strings

    .. inheritance-diagram:: regexp"""

    def __init__(self, sigma=None):
        self.val = None
        self.Sigma = sigma
        self.arg = None

    @abstractmethod
    def rpn(self):
        """ RPN representation
        :rtype: str
        :return: printable RPN representation"""
        pass

    @abstractmethod
    def alphabeticLength(self):
        """Number of occurrences of alphabet symbols in the regular expression.

        :rtype: integer

        .. attention:: Doesn't include the empty word."""
        pass

    @abstractmethod
    def treeLength(self):
        """Number of nodes of the regular expression's syntactical tree.

        :rtype: integer"""
        pass

    @abstractmethod
    def epsilonLength(self):
        """Number of occurrences of the empty word in the regular expression.

        :rtype: integer"""
        pass

    @abstractmethod
    def starHeight(self):
        """Maximum level of nested regular expressions with a star operation applied.

        For instance, starHeight(((a*b)*+b*)*) is 3.

        :rtype: integer"""
        return 0

    @abstractmethod
    def __repr__(self):
        pass

    @abstractmethod
    def __str__(self):
        pass


    @abstractmethod
    def unmark(self):
        pass

    @abstractmethod
    def mark(self):
        """ Make all atoms maked (tag False)
        :rtype: reex.regexp"""
        pass

    @abstractmethod
    def linearForm(self):
        """
        :rtype: dic"""
        pass

    @abstractmethod
    def tailForm(self):
        """
        :rtype: dict"""
        pass

    @abstractmethod
    def reduced(self):
        pass

    @staticmethod
    def emptysetP():
        """Whether the regular expression is the empty set.

        :rtype: Boolean"""
        return False

    @abstractmethod
    def first(self):
        """
        :rtype: set"""
        pass

    @abstractmethod
    def followLists(self):
        pass

    @abstractmethod
    def followListsD(self):
        pass

    @abstractmethod
    def last(self):
        """
        :rtype: set"""
        pass

    @abstractmethod
    def _marked(self):
        pass

    @abstractmethod
    def _memoLF(self):
        pass

    @abstractmethod
    def setOfSymbols(self):
        """
        :rtype: set """
        pass

    @abstractmethod
    def derivative(self):
        pass

    @staticmethod
    def _setSigma(strict=False):
        """
        :param strict:
        :type str
        ict: bool"""
        pass

    @abstractmethod
    def snf(self):
        pass

    @abstractmethod
    def support(self, side=True):
        pass

    @abstractmethod
    def supportlast(self, side=True):
        pass

    @abstractmethod
    def _follow(self):
        pass

    def toNFA(self, nfa_method="nfaPD"):
        """NFA that accepts the regular expression's language.
        :param nfa_method: """

        return self.__getattribute__(nfa_method)()

    def toDFA(self):
        """DFA that accepts the regular expression's language

        .. versionadded 0.9.6"""
        # return self.dfaAuPoint() Fails in tests
        return self.toNFA().toDFA()

    def unionSigma(self, other):
        """Returns the union of two alphabets

        :type other: reex.regexp
        :rtype: set """
        if self.Sigma is None:
            return other.Sigma
        elif other.Sigma is None:
            return self.Sigma
        else:
            return self.Sigma.union(other.Sigma)

    def nfaPD(self):
        """NFA that accepts the regular expression's language,
           and which is constructed from the expression's partial derivatives.

        :return: partial derivatives [or equation] automaton
        :rtype: NFA

        .. seealso:: V. M. Antimirov, Partial Derivatives of Regular Expressions and Finite Automaton Constructions
           .Theor. Comput. Sci.155(2): 291-319 (1996)"""
        nfa = fa.NFA()
        i = nfa.addState(self)
        nfa.addInitial(i)
        if self.Sigma is not None:
            nfa.setSigma(self.Sigma)
        stack = [(self, i)]
        added_states = {self: i}
        while stack:
            state, state_idx = stack.pop()
            state_lf = state.linearForm()
            for head in state_lf:
                tails = state_lf[head]
                nfa.addSigma(head)
                for pd in tails:
                    if pd in added_states:
                        pd_idx = added_states[pd]
                    else:
                        try:
                            pd_idx = nfa.addState(pd)
                        except DuplicateName:
                            pd_idx = nfa.stateIndex(pd)
                        added_states[pd] = pd_idx
                        stack.append((pd, pd_idx))
                    nfa.addTransition(state_idx, head, pd_idx)
            if state.ewp():
                nfa.addFinal(state_idx)
        return nfa

    def nfaPre(self):
        """
        Prefix NFA of a regular expression
        :return: prefix automaton
        :rtype: NFA
        .. seealso:: Maia et al, Prefix and Right-partial derivative automata, 11th CIE 2015, 258-267  LNCS 9136, 2015
        """
        nfa = fa.NFA()
        if self.Sigma is not None:
            nfa.setSigma(self.Sigma)
        i = nfa.addState(epsilon())
        nfa.addInitial(i)
        todo = []
        added_states = {epsilon():i}
        if self.ewp():
            nfa.addFinal(i)
        state_tf = self.tailForm()
        for tail  in state_tf:
            heads = state_tf[tail]
            for p, p_t in heads:
                # if p_t.epsilonP():
                #     p = atom(tail, self.Sigma)
                # else:
                #     p = concat(p_t, atom(tail), self.Sigma)
                if p not in added_states:
                    try:
                        p_idx = nfa.addState(p)
                    except DuplicateName:
                        p_idx = nfa.stateIndex(p)
                    nfa.addFinal(p_idx)
                    added_states[p] = p_idx
                    todo.append((p_t, tail,  p_idx))
        while todo:
            state, tail_st , state_idx = todo.pop()
            if state.ewp():
                nfa.addTransition(i, tail_st, state_idx)
            state_tf = state.tailForm()
            for tail in state_tf:
                heads = state_tf[tail]
                nfa.addSigma(tail)
                for p, p_t in heads:
                    # if p_t.epsilonP():
                    #     p = atom(tail, self.Sigma)
                    # else:
                    #     p = concat(p_t, atom(tail), self.Sigma)
                    if p in added_states:
                        p_idx = added_states[p]
                    else:
                        try:
                            p_idx = nfa.addState(p)
                        except DuplicateName:
                            p_idx = nfa.stateIndex(p)
                        added_states[p] = p_idx
                        todo.append((p_t, tail, p_idx))
                    nfa.addTransition(p_idx, tail_st , state_idx)
        return nfa


    def epsilonP(self):
        """Whether the regular expression is the empty word.

        :rtype: Boolean"""
        return False

    def ewp(self):
        """Whether the empty word property holds for this regular expression's language.

        :rtype: Boolean"""
        return False

    def _odot(self, sre, d=True):
        """ Concatenates a set of res or tuples of res with a re
        :param sre: set of res
        :param d: if True concatenates re on the right else on the left
        :type d: bool
        :return:"""
        def _ifconcat(re0, re1, dd):
            """

            :rtype : object
            """
            if re0.epsilonP():
                return re1
            if dd:
                return concat(re0, re1, self.Sigma)
            else:
                return concat(re1, re0, self.Sigma)

        if sre == set():
            return set()
        f = list(sre)
        if f[0] is tuple:
            try:
                if f[0][1] is 2:
                    return {(_ifconcat(j, self, d), (s, _ifconcat(i, self, d))) for j, (s, i) in f}
                else:
                    return {(j, _ifconcat(i, self, d)) for j, i in f}
            except:
                raise FAdoGeneralError("tuple with wrong size")
        else:
            return {_ifconcat(i, self, d) for i in f}


    def __eq__(self, r):
        """Whether the string representations of two regular expressions are equal."""
        if type(r) == type(self) and ((self.Sigma is None) or (r.Sigma is None) or (self.Sigma == r.Sigma)):
            return repr(self) == repr(r)
        else:
            return False

    def __ne__(self, r):
        """Whether the string representations of two regular expressions are different."""
        return not self.__eq__(r)

    def __hash__(self):
        """Hash over regular expression's string representation"""
        return hash(repr(self))

    def _faPosition(self, aut, initial, lstar=True):
        if self.ewp():
            aut.addFinal(initial)
        stack = []
        added_states = {}
        for sym in self.first():
            try:
                state_idx = aut.addState(str(sym))
            except DuplicateName:
                state_idx = aut.stateIndex(str(sym))
            added_states[sym] = state_idx
            stack.append((sym, state_idx))
            aut.addTransition(initial, sym.symbol(), state_idx)
        if lstar is False:
            follow_sets = self.followLists()
        else:
            follow_sets = self.followListsD()
        while stack:
            state, state_idx = stack.pop()
            for sym in follow_sets[state]:
                if sym in added_states:
                    next_state_idx = added_states[sym]
                else:
                    next_state_idx = aut.addState(str(sym))
                    added_states[sym] = next_state_idx
                    stack.append((sym, next_state_idx))
                aut.addTransition(state_idx, sym.symbol(), next_state_idx)
        for sym in self.last():
            if sym in added_states:
                aut.addFinal(added_states[sym])
        return aut


    def nfaPosition(self, lstar=True):
        """Position automaton of the regular expression.

        :arg lstar: if not None followlists are computed dijunct
        :type lstar: boolean
        :return: position NFA
        :rtype: NFA

        .. seealso:  Glushkov, 61"""
        nfa = fa.NFA()
        initial = nfa.addState("Initial")
        nfa.addInitial(initial)
        if self.Sigma is not None:
            nfa.setSigma(self.Sigma)
        return self.marked()._faPosition(nfa, initial, lstar)

    def dfaYMG(self):
        """ DFA Yamada-McNaugthon-Gluskov acconding to Nipkow

        :return: Y-M-G DFA
        :rtype: DFA

        .. seealso:: Tobias Nipkow and Dmitriy Traytel, Unified Decision Procedures for Regular Expression Equivalence"""

        aut = fa.DFA()
        sigma = self.setOfSymbols()
        s = (True, self.mark())
        i = aut.addState(s)
        stack = [(s, i)]
        added = {s}
        aut.setInitial(i)
        while stack:
            ((m, r), i) = stack.pop()
            if r._final() or (m and r.ewp()):
                aut.addFinal(i)
            for a in sigma:
                s1 = (False, r._follow(m)._read(a))
                if s1 not in added:
                    i1 = aut.addState(s1)
                    stack.append((s1, i1))
                    added.add(s1)
                else:
                    i1 = aut.stateIndex(s1)
                aut.addTransition(i, a, i1)
        return aut

    def dfaAuPoint(self):
        """ DFA "au-point" acconding to Nipkow

        :return: "au-point" DFA
        :rtype: fa.DFA

        .. seealso:: Andrea Asperti, Claudio Sacerdoti Coen and Enrico Tassi, Regular Expressions, au point. arXiv 2010

        .. seealso:: Tobias Nipkow and Dmitriy Traytel, Unified Decision Procedures for Regular Expression Equivalence"""
        aut = fa.DFA()
        sigma = self.setOfSymbols()
        s = (self.ewp(), self.mark()._follow(True))
        i = aut.addState(s)
        stack = [(s, i)]
        added = {s}
        aut.setInitial(i)
        while stack:
            ((m, r), i) = stack.pop()
            if m:
                aut.addFinal(i)
            for a in sigma:
                foo = r._read(a)
                s1 = (foo._final(), foo._follow(False))
                if s1 not in added:
                    i1 = aut.addState(s1)
                    stack.append((s1, i1))
                    added.add(s1)
                else:
                    i1 = aut.stateIndex(s1)
                aut.addTransition(i, a, i1)
        return aut

    def _dfaPosition(self):
        """Deterministic position automaton of a regular expression.

        :return: position DFA
        :rtype: DFA

        :raise common.DFAnotNFAFAdo: if not DFA

        .. note:: If this expression is not linear (cf. linearP()), exception may be raised
                  on non-deterministic transitions.

        .. seealso:  Glushkov, 61"""
        dfa = fa.DFA()
        initial = dfa.addState("Initial")
        dfa.setInitial(initial)
        if self.Sigma is not None:
            dfa.setSigma(self.Sigma)
        return self.marked()._faPosition(dfa, initial)

    def nfaPSNF(self):
        """Position or Glushkov automaton of the regular expression constructed from the expression's star normal form.

        :return: position automaton
        :rtype: NFA

        .. seeall: Brüggemann-Klein, 92"""
        return self.snf().nfaPosition(lstar=False)

    def nfaPDO(self):
        """NFA that accepts the regular expression's language, and which is constructed from the expression's partial
         derivatives.

        .. note:: optimized version

        :return: partial derivatives [or equation] automaton
        :rtype: NFA"""
        nfa = fa.NFA()
        i = nfa.addState(self)
        nfa.addInitial(i)
        if self.Sigma is not None:
            nfa.setSigma(self.Sigma)
        stack = [(self, i)]
        added_states = {self: i}
        while stack:
            state, state_idx = stack.pop()
            state._memoLF()
            for head in state._lf:
                nfa.addSigma(head)
                for pd in state._lf[head]:
                    if pd in added_states:
                        pd_idx = added_states[pd]
                    else:
                        pd_idx = nfa.addState(pd)
                        added_states[pd] = pd_idx
                        stack.append((pd, pd_idx))
                    nfa.addTransition(state_idx, head, pd_idx)
            if state.ewp():
                nfa.addFinal(state_idx)
        self._delAttr("_lf")
        return nfa

    def _dfaD(self):
        """Word derivatives automaton of the regular expression

        :return: word derivatives automaton
        :rtype: DFA

        .. attention:
             This is a probably non terminating method. Must be removed. (nam)
        .. seealso:
            J. A. Brzozowski, Derivatives of Regular Expressions. J. ACM 11(4): 481-494 (1964)"""
        dfa = fa.DFA()
        initial = self
        initial_idx = dfa.addState(initial)
        dfa.setInitial(initial_idx)
        if self.Sigma is not None:
            dfa.setSigma(self.Sigma)
        dfa.setSigma(initial.setOfSymbols())
        stack = [(initial, initial_idx)]
        while stack:
            state, state_idx = stack.pop()
            for sigma in dfa.Sigma:
                d = state.derivative(sigma).reduced()
                if d not in dfa.States:
                    d_idx = dfa.addState(d)
                    stack.append((d, d_idx))
                else:
                    d_idx = dfa.stateIndex(d)
                dfa.addTransition(state_idx, sigma, d_idx)
            if state.ewp():
                dfa.addFinal(state_idx)
        return dfa

    def _delAttr(self, attr):
        if hasattr(self, attr):
            delattr(self, attr)

    def marked(self):
        """Regular expression in which every alphabetic symbol is marked with its position.

        The kind of regular expression returned is known, depending on the literary source, as marked,
        linear or restricted regular expression.

        :return: linear regular expression
        :rtype: reex.regexp

        .. seealso:: R. McNaughton and H. Yamada, Regular Expressions and State Graphs for Automata,
            IEEE Transactions on Electronic Computers, V.9 pp:39-47, 1960

        ..attention: mark and unmark do not preserve the alphabet, neither set the new alphabet """
        return self._marked(0)[0]

    def setSigma(self, symbolSet=None, strict=False):
        """ Set the alphabet for a regular expression and all its nodes

        :arg symbolSet: accepted symbols. If None, alphabet is unset.
        :type symbolSet: list or set of str
        :arg strict: if True checks if setOfSymbols is included in symbolSet
        :type strict: bool

        ..attention: Normally this attribute is not defined in a regexp()"""
        if symbolSet is not None:
            if strict and not (self.setOfSymbols() <= symbolSet):
                raise regexpInvalidSymbols()
            self.Sigma = set(symbolSet)
        else:
            self.Sigma = None
        self._setSigma(symbolSet)

    def equivalentP(self, other):
        """Tests equivalence

        :param other:
        :rtype: bool

        .. versionadded: 0.9.6"""
        if issubclass(type(other), fa.OFA):
            return other.equivalentP(self)
        return self.compare(other)

    def compareMinimalDFA(self, r, nfa_method="nfaPosition"):
        """Compare with another regular expression for equivalence through minimal DFAs.
        :param r:
        :param nfa_method: """
        fa0 = self.toNFA(nfa_method).toDFA()
        fa1 = r.toNFA(nfa_method).toDFA()
        return fa0 == fa1

    def evalWordP(self, word):
        """Verifies if a word is a member of the language represented by the regular expression.

        :param str word: the word
        :rtype: bool"""

        return self.wordDerivative(word).ewp()

    def compare(self, r, cmp_method="compareMinimalDFA", nfa_method="nfaPD"):
        """Compare with another regular expression for equivalence.
        :param r:
        :param cmp_method:
        :param nfa_method:
        """
        if cmp_method == "compareMinimalDFA":
            return self.compareMinimalDFA(r, nfa_method)

    def nfaNaiveFollow(self):
        """NFA that accepts the regular expression's language, and is equal in structure to the follow automaton.

        :rtype: NFA

        .. note:: Included for testing purposes.

        .. seealso:: Ilie & Yu (Follow Automata, 2003)"""
        return self.snf().marked().nfaGlushkov().minimal().unmark()

    def dfaNaiveFollow(self):
        return self.nfaNaiveFollow().toDFA()

    def dfaPD(self):
        return self.nfaPD().toDFA()

    def nfaFollow(self):
        """NFA that accepts the regular expression's language, whose structure, and construction.

        :rtype: NFA

        .. The regular expression must be reduced

        .. seealso:: Ilie & Yu (Follow Automata, 03)"""
        nfa = self.nfaFollowEpsilon(False).toNFA()
        queue = deque(nfa.Initial)
        inverse_topo_order = deque()
        visited = set(nfa.Initial)
        while queue:
            state = queue.popleft()
            if nfa.hasTransitionP(state, Epsilon):
                inverse_topo_order.appendleft(state)
            if state in nfa.delta:
                for symbol in nfa.delta[state]:
                    for s in nfa.delta[state][symbol]:
                        if s not in visited:
                            queue.append(s)
                            visited.add(s)
        for i in inverse_topo_order:
            nfa.closeEpsilon(i)
        nfa.trim()
        return nfa

    def _nfaGlushkovStep(self, nfa, initial, final):
        """

        :param nfa:
        :param initial:
        :param final:
        :return:
        """
        pass

    def nfaGlushkov(self):
        """ Position or Glushkov automaton of the regular expression. Recursive method.


        :return: NFA
        """
        nfa = fa.NFA()
        initial = nfa.addState("Initial")
        nfa.addInitial(initial)
        if self.Sigma is not None:
            nfa.setSigma(self.Sigma)
        _, final = self._nfaGlushkovStep(nfa, nfa.Initial, set())
        nfa.Final = final
        return nfa


    def nfaFollowEpsilon(self, trim=True):
        """Epsilon-NFA constructed with Ilie and Yu's method () that accepts the regular expression's language.

        :param trim:
        :return: NFA possibly with epsilon transitions
        :rtype: NFAe

        .. note:: The regular expression must be reduced
        .. seealso:: Ilie & Yu, Follow automta, Inf. Comp. ,v. 186 (1),140-162,2003
        .. _a link: http://dx.doi.org/10.1016/S0890-5401(03)00090-7"""
        nfa = fa.NFAr()
        initial = nfa.addState("Initial")
        final = nfa.addState("Final")
        if self.Sigma is not None:
            nfa.setSigma(self.Sigma)
        self._nfaFollowEpsilonStep((nfa, initial, final))
        if len(nfa.delta.get(initial, [])) == 1 and \
                len(nfa.delta[initial].get(Epsilon, [])) == 1:
            new_initial = nfa.delta[initial][Epsilon].pop()
            del (nfa.delta[initial])
            nfa.deltaReverse[new_initial][Epsilon].remove(initial)
            initial = new_initial
        nfa.setInitial([initial])
        nfa.setFinal([final])
        if trim:
            nfa.trim()
        return nfa

    def wordDerivative(self, word):
        """Derivative of the regular expression in relation to the given word,
           which is represented by a list of symbols.

        :param word: list of arbitrary symbols.
        :rtype: regular expression

        .. seealso:: J. A. Brzozowski, Derivatives of Regular Expressions. J. ACM 11(4): 481-494 (1964)

        .. note: semantically, the list represents a catenation of symbols (word), and its alphabet is not checked."""
        d = copy.deepcopy(self)
        for sigma in word:
            d = d.derivative(sigma)
        return d

    def equivP(self, r):
        """Verifies if two regular expressions are equivalent.

        :arg r: regular expression
        :rtype: boolean"""
        s = [(self, r)]
        h = {(self, r)}
        sigma = self.setOfSymbols().union(r.setOfSymbols())
        while s:
            s1, s2 = s.pop()
            if s1.ewp() != s2.ewp():
                return False
            for a in sigma:
                der1 = s1.derivative(a)
                der2 = s2.derivative(a)
                if (der1, der2) not in h:
                    h.add((der1, der2))
                    s.append((der1, der2))
        return True

    def dfaBrzozowski(self, memo=None):
        """Word derivatives automaton of the regular expression

        :return: word derivatives automaton
        :rtype: DFA

        .. seealso::
            J. A. Brzozowski, Derivatives of Regular Expressions. J. ACM 11(4): 481-494 (1964)"""
        dfa = fa.DFA()
        i = dfa.addState(self)
        dfa.setInitial(i)
        stack = [(self, i)]
        sigma = self.setOfSymbols()
        if memo:
            states = {self: i}
        while stack:
            state, idx = stack.pop()
            state.setSigma(sigma)
            for symbol in sigma:
                st = state.derivative(symbol)
                if memo:
                    if st in states:
                        i = states[st]
                    else:
                        i = dfa.addState(st)
                        states[st] = i
                        stack.append((st, i))
                else:
                    if st in dfa.States:
                        i = dfa.stateName(st)
                    else:
                        i = dfa.addState(st)
                        stack.append((st, i))
                dfa.addTransition(idx, symbol, i)
            if state.ewp():
                dfa.addFinal(idx)
        return dfa


    def _dot(self, r):
        """Computes the concatenation of two regular expressions.

        :arg r: a regular expression
        :type r: reex.regexp
        :rtype: reex.regexp

        .. note: used in sre expressions
        """
        if r.epsilonP() or r.emptysetP():
             return r._dot(self)
        elif type(r) is sconcat:
            r0 = sconcat((self,) + r.arg,self.Sigma)
            if self.Sigma and r0.Sigma:
                r0.Sigma = r.Sigma | self.Sigma
            return r0
        else:
            r0 = sconcat((self,r),self.Sigma)
            if self.Sigma and r.Sigma:
                r0.Sigma = r.Sigma | self.Sigma
            return r0

    def _plus(self, r0):
        """Computes the disjunction of two regular expressions.

        :arg r0: a regular expression
        :type r0: reex.regexp
        :rtype: reex.regexp"""
        if r0 == self:
            if self.Sigma and r0.Sigma:
                r0.Sigma = r0.Sigma | self.Sigma
            return r0
        elif type(r0) is emptyset or type(r0) is sigmaS or type(r0) is sdisj:
            return r0._plus(self)
        else:
            r = sdisj(frozenset([self,r0]),self.Sigma)
            if self.Sigma and r0.Sigma:
                r.Sigma = r0.Sigma | self.Sigma
            return r


    def _inter(self, r):
        """Computes the conjunction of two regular expressions.

        :arg r: a regular expression
        :type r: reex.regexp
        :rtype: reex.regexp"""
        if r == self:
            if self.Sigma and r.Sigma:
                r.Sigma = r.Sigma | self.Sigma
            return r
        elif r.emptysetP() or type(r) is sigmaS or type(r) is sconj:
            return r._inter(self)
        else:
            r1 = sconj(frozenset([self,r]),self.Sigma)
            if self.Sigma and r.Sigma:
                r1.Sigma = r.Sigma | self.Sigma
            return r1

class atom(regexp):
    """ Simple atom (symbol)

    :var Sigma: alphabet set of strings
    :var val: the actual symbol

    .. inheritance-diagram:: regexp"""

    def __init__(self, val, sigma=None):
        """Constructor of a regular expression symbol.

        :arg val: the actual symbol"""
        super(atom, self).__init__()
        self.val = val
        self.Sigma = sigma

    def __repr__(self):
        """Representation of the regular expression's syntactical tree."""
        return 'atom({0:>s})'.format(self.__str__())

    def __str__(self):
        """String representation of the regular expression."""
        return str(self.val)

    _strP = __str__

    def __len__(self):
        """Size of the RE (the tree length)

        :rtype: int"""
        return self.treeLength()

    def mark(self):
        """
        :rtype: m_atom"""
        return m_atom(self.val, False, self.Sigma)

    @abstractmethod
    def unmark(self):
        pass

    def rpn(self):
        """RPN representation
        :return: printable RPN representation"""
        return "%s" % repr(self.val)

    def __copy__(self):
        """Reconstruct the regular expression's syntactical tree, or, in other words,
           perform a shallow copy of the tree.
        :rtype: atom

        .. note::
           References to the expression's symbols in the leafs are preserved.

        .. attention:: Raw modifications on the regular expression's tree should be performed over a copy returned by this method, so that cached methods do not interfere."""
        return atom(self.val)

    def setOfSymbols(self):
        """Set of symbols that occur in a regular expression..

        :return: set of symbols
        :rtype: set of symbols"""
        return {self.val}

    def stringLength(self):
        """Length of the string representation of the regular expression.

        :rtype: integer"""
        return len(str(self))

    @staticmethod
    def measure(from_parent=None):
        """A list with four measures for regular expressions.

        :param from_parent:
        :rtype: [int,int,int,int]

        [alphabeticLength, treeLength, epsilonLength, starHeight]

        1. alphabeticLength: number of occurences of symbols of the alphabet;

        2. treeLength: number of functors in the regular expression, including constants.

        3. epsilonLength: number of occurrences of the empty word.

        4. starHeight: highest level of nested Kleene stars, starting at one for one star occurrence.

        5. disjLength: number of occurrences of the disj operator

        6. concatLength: number of occurrences of the concat operator

        7. starLength: number of occurrences of the star operator

        8. conjLength: number of occurrences of the conj operator

        9. starLength: number of occurrences of the shuffle operator

        .. attention::
           Methods for each of the measures are implemented independently. This is the most effective for obtaining
           more than one measure."""
        if not from_parent:
            from_parent = 9*[0]
        from_parent[0] += 1
        from_parent[1] += 1
        return from_parent

    @staticmethod
    def alphabeticLength():
        """Number of occurrences of alphabet symbols in the regular expression.

        :rtype: integer

        .. attention:: Doesn't include the empty word."""
        return 1

    @staticmethod
    def treeLength():
        """Number of nodes of the regular expression's syntactical tree.

        :rtype: integer"""
        return 1

    @staticmethod
    def syntacticLength():
        """Number of nodes of the regular expression's syntactical tree (sets).

        :rtype: integer"""
        return 1

    @staticmethod
    def epsilonLength():
        """Number of occurrences of the empty word in the regular expression.

        :rtype: integer"""
        return 0

    @staticmethod
    def starHeight():
        """Maximum level of nested regular expressions with a star operation applied.

        For instance, starHeight(((a*b)*+b*)*) is 3.

        :rtype: integer"""
        return 0


    def reduced(self, hasEpsilon=False):
        """Equivalent regular expression with the following cases simplified:

        1. Epsilon.RE = RE.Epsilon = RE

        2. EmptySet.RE = RE.EmptySet = EmptySet

        3. EmptySet + RE = RE + EmptySet = RE

        4. Epsilon + RE = RE + Epsilon = RE, where Epsilon is in L(RE)

        5. RE** = RE*

        6. EmptySet* = Epsilon* = Epsilon

        7.Epsilon:RE = RE:Epsilon= RE

        :param hasEpsilon: used internally to indicate that the language of which this term is a subterm has the empty
            word.
        :return: regular expression

        .. attention::
           Returned structure isn't strictly a duplicate. Use __copy__() for that purpose."""
        return self

    _reducedS = reduced

    def linearP(self):
        """Whether the regular expression is linear; i.e., the occurrence of a symbol in the expression is unique.

        :rtype: boolean"""
        return len(self.setOfSymbols()) is self.alphabeticLength()

    def _nfaFollowEpsilonStep(self, conditions):
        """Construction step of the Epsilon-NFA defined by Ilie & Yu for this class.

        :param conditions: A tuple consisting of an NFA, the initial state, and the final state in the context. A
        sub-automaton within the given automaton is thus constructed."""
        nfa, initial, final = conditions
        nfa.addSigma(self.val)
        nfa.addTransition(initial, self.val, final)

    def _nfaGlushkovStep(self, nfa, initial, final):
        try:
            target = nfa.addState(self.val)
        except DuplicateName:
            target = nfa.addState()
            # target = nfa.stateIndex(self.val)
        for source in initial:
            nfa.addTransition(source, self.val, target)
        final.add(target)
        return initial, final

    def first(self, parent_first=None):
        """List of possible symbols matching the first symbol of a string in the language of the regular expression.

        :param parent_first:
        :return: list of symbols"""
        if parent_first is None:
            return [self]
        parent_first.append(self)
        return parent_first

    def last(self, parent_last=None):
        """List of possible symbols matching the last symbol of a string in the language of the regular expression.

        :param parent_last:
        :return: list of symbols
        :rtype: list"""
        if parent_last is None:
            return [self]
        parent_last.append(self)
        return parent_last

    def followLists(self, lists=None):
        """Map of each symbol's follow list in the regular expression.

        :param lists:
        :return: map of symbols' follow lists
        :rtype: {symbol: list of symbols}

        .. attention::
           For first() and last() return lists, the follow list for certain symbols might have repetitions in the
           case  of follow maps calculated from star operators. The union of last(),
           first() and follow() sets are always disjoint when the regular expression is in star normal form (
           Brüggemann-Klein, 92), therefore FAdo implements them as lists. You should order exclusively,
           or take a set from a list in order to resolve repetitions."""
        if lists is None:
            return {self: []}
        if self not in lists:
            lists[self] = []
        return lists

    def followListsD(self, lists=None):
        """Map of each symbol's follow list in the regular expression.

        :param lists:
        :return: map of symbols' follow lists
        :rtype: {symbol: list of symbols}

        .. attention::
           For first() and last() return lists, the follow list for certain symbols might have repetitions in the case
           of follow maps calculated from star operators. The union of last(), first() and follow() sets are always
           disjoint

        .. seealso:: Sabine Broda, António Machiavelo, Nelma Moreira, and Rogério Reis. On the average size of
            glushkov and partial derivative automata. International Journal of Foundations of Computer Science,
            23(5):969-984, 2012."""
        if lists is None:
            return {self: []}
        if self not in lists:
            lists[self] = []
        return lists

    def followListsStar(self, lists=None):
        """Map of each symbol's follow list in the regular expression under a star.

        :param lists:
        :return: map of symbols' follow lists
        :rtype: {symbol: list of symbols}"""
        if lists is None:
            return {self: [self]}
        if self not in lists:
            lists[self] = [self]
        return lists

    def _marked(self, pos):
        pos += 1
        return position((self.val, pos)), pos

    def unmarked(self):
        """The unmarked form of the regular expression. Each leaf in its syntactical tree becomes a regexp(),
        the epsilon() or the emptyset().

        :rtype: (general) regular expression"""
        return self.__copy__()

    @abstractmethod
    def _follow(self, flag):
        pass

    def derivative(self, sigma):
        """Derivative of the regular expression in relation to the given symbol.

        :param sigma: an arbitrary symbol.
        :rtype: regular expression

        .. note:: whether the symbols belong to the expression's alphabet goes unchecked. The given symbol will be
           matched against the string representation of the regular expression's symbol.

        .. seealso:: J. A. Brzozowski, Derivatives of Regular Expressions. J. ACM 11(4): 481-494 (1964)"""
        if str(sigma) == str(self):
            return epsilon(self.Sigma)
        return emptyset(self.Sigma)

    def partialDerivatives(self, sigma):
        """Set of partial derivatives of the regular expression in relation to given symbol.

        :param sigma: symbol in relation to which the derivative will be calculated.
        :return: set of regular expressions

        .. seealso:: Antimirov, 95"""
        if sigma == self.val:
            return {epsilon(self.Sigma)}
        return set()

    def linearForm(self):
        """Linear form of the regular expression , as a mapping from heads to sets of tails, so that each pair (head,
        tail) is a monomial in the set of linear forms.

        :return: dictionary mapping heads to sets of tails
        :rtype: {symbol: set([regular expressions])}

        .. seealso:: Antimirov, 95"""
        return {self.val: {epsilon(self.Sigma)}}

    def PD(self):
        """Closure of partial derivatives of the regular expression in relation to all words.

        :return: set of regular expressions
        :rtype: set

        .. seealso:: Antimirov, 95"""
        pd = set()
        stack = [self]
        while stack:
            r = stack.pop()
            pd.add(r)
            lf = r.linearForm()
            for head in lf:
                for tail in lf[head]:
                    if tail not in pd:
                        stack.append(tail)
        return pd

    def support(self, side=True):
        """Support of a regular expression.
        :param side: if True concatenation of a set on the left if False on the right (prefix support)
        :return: set of regular expressions
        :rtype: set

        .. seealso::
            Champarnaud, J.M., Ziadi, D.: From Mirkin's prebases to Antimirov's word partial derivative.
            Fundam. Inform. 45(3), 195-205 (2001)
         .. seealso::
            Maia et al, Prefix and Right-partial derivative automata, 11th CIE 2015, 258-267  LNCS 9136, 2015"""

        if side:
            return {epsilon(self.Sigma)}
        else:
            return {self}

    def supportlast(self, side=True):
        """ Subset of support such that elements have ewp
        """
        if side:
            return {epsilon(self.Sigma)}
        else:
            return {self}

    def _memoLF(self):
        if not hasattr(self, "_lf"):
            self._lf = {self.val: {epsilon(self.Sigma)}}

    def tailForm(self):
        """

        :return:
        """
        return {self.val: { (self, epsilon(self.Sigma))}}

    def snf(self, hollowdot=False):
        """Star Normal Form (SNF) of the regular expression.

        :param hollowdot:
        :return: regular expression in star normal form

        .. seealso: Brüggemann-Klein, 92"""
        return self

    def nfaThompson(self):
        """Epsilon-NFA constructed with Thompson's method that accepts the regular expression's language.

        :rtype: NFA

        .. seealso:: K. Thompson. Regular Expression Search Algorithm. CACM 11(6), 419-422 (1968)"""
        aut = fa.NFA()
        s0 = aut.addState()
        s1 = aut.addState()
        aut.setInitial([s0])
        if self.Sigma is None:
            aut.setSigma([self.val])
        else:
            aut.setSigma(self.Sigma)
        aut.setFinal([s1])  # val
        aut.addTransition(s0, self.val, s1)  # >(0)---->((1))
        return aut

    def reversal(self):
        """Reversal of regexp

        :rtype: reex.regexp"""
        return self.__copy__()

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return: """
        if self.val == sigma:
            return {sigmaP(self.Sigma)}
        else:
            return {sigmaS(self.Sigma)}

    def linearFormC(self):
        """
        :return:
        """
        lf = {}
        for i in self.Sigma:
            if i == self.val:
                lf[i] = {sigmaP(self.Sigma)}
            else:
                lf[i] = {sigmaS(self.Sigma)}
        return lf


class m_atom(atom):
    """ Base class for pointed (marked) regular expressions

        Used directly to represent atoms (characters). This class is used to obtain Yamada or Asperti automata.
        There is no evident use for it, outside this module. """

    def __init__(self, val, mark, sigma=None):
        """
        :param val: symbol
        :type mark: bool
        :param sigma: alphabet"""
        super(m_atom, self).__init__(val, sigma)
        self.val = val
        self.mark = mark
        self.Sigma = sigma

    def __repr__(self):
        """Representation of the regular expression's syntactical tree."""
        return 'matom(%s,%s)' % (str(self.val), str(self.mark))

    def __str__(self):
        """String representation of the regular expression."""
        if self.mark:
            return "." + str(self.val)
        else:
            return str(self.val)

    _strP = __str__

    def unmark(self):
        """ Conversion back to regexp

        :rtype: reex.regexp"""
        return atom(self.val, self.Sigma)

    def _final(self):
        """ Nipkow auxiliary function final
        :rtype: bool"""
        return self.mark

    def _read(self, val):
        """ Nipkow auxiliary function final

        :param val: symbol
        :returns: the p_regexp with all but val marks removed
        :rtype: p_regexp """
        if self.val == val:
            return self
        else:
            return m_atom(self.val, False, self.Sigma)

    def _follow(self, flag):
        """ Nipkow follow function
        :type flag: bool
        :rtype: m_atom"""
        return m_atom(self.val, flag, self.Sigma)


class specialConstant(regexp):
    """Base class for Epsilon and EmptySet

    .. inheritance-diagram:: specialConstant"""

    def __init__(self, sigma=None):
        """
        :param sigma: alphabet"""
        super(specialConstant, self).__init__()
        self.Sigma = sigma

    def __copy__(self):
        """
        :return: """
        return self

    @staticmethod
    def setOfSymbols():
        """
        :return: """
        return set()

    @staticmethod
    def alphabeticLength():
        """
        :return: """
        return 0

    @staticmethod
    def treeLength():
        return 1

    @staticmethod
    def starHeight():
        return 0

    @staticmethod
    def epsilonLength():
        return 0

    def snf(self):
        return self

    @abstractmethod
    def __repr__(self):
        pass

    @abstractmethod
    def rpn(self):
        pass

    @abstractmethod
    def __hash__(self):
        pass

    @abstractmethod
    def partialDerivatives(self):
        pass

    def _marked(self, pos):
        """
        :param pos:
        :return: """
        return self, pos

    def mark(self):
        return self

    def unmark(self):
        """ Conversion back to unmarked atoms
        :rtype: specialConstant """
        return self

    @staticmethod
    def _final():
        """ Nipkow auxiliary function final
        :rtype: bool"""
        return False

    def _read(self, _):
        """ Nipkow auxiliary function final

        :returns: the p_regexp with all but val marks removed
        :rtype: p_regexp """
        return self

    def _follow(self, _):
        """ Nipkow follow function
        :rtype: specialConstant"""
        return self

    def unmarked(self):
        """The unmarked form of the regular expression. Each leaf in its syntactical tree becomes a regexp(),
        the epsilon() or the emptyset().

        :rtype: (general) regular expression"""
        return self

    def reduced(self, hasEpsilon=False):
        return self

    _reducedS = reduced

    @staticmethod
    def first(parent_first=None):
        """
        :param parent_first:
        :return: """
        if parent_first is None:
            return []
        return parent_first

    def last(self, parent_last=None):
        """
        :param parent_last:
        :return: """
        if parent_last is None:
            return []
        return parent_last

    def followLists(self, lists=None):
        """
        :param lists:
        :return: """
        if lists is None:
            return {}
        return lists

    def followListsD(self, lists=None):
        """
        :param lists:
        :return: """
        if lists is None:
            return {}
        return lists

    @staticmethod
    def followListsStar(lists=None):
        """
        :param lists:
        :return: """
        if lists is None:
            return {}
        return lists

    def derivative(self, sigma):
        """
        :param sigma:
        :return: """
        return emptyset(self.Sigma)

    def wordDerivative(self, word):
        """
        :param word:
        :return: """
        return self

    def linearForm(self):
        """
        :return: """
        return {}

    def tailForm(self):
        """
        :return: """
        return {}

    def linearFormC(self):
        lf = {}
        for a in self.Sigma:
            lf[a] = {sigmaS(self.Sigma)}
        return lf

    def _memoLF(self):
        """
        :return: """
        return self._lf

    def _delAttr(self, attr):
        """

        :param attr:
        :return:"""
        pass

    _lf = {}

    def support(self, side=True):
        """
        :return:"""
        return set()

    def supportlast(self, side=True):
        """
        :return:"""
        return set()

    def reversal(self):
        """Reversal of regexp

        :rtype: reex.regexp"""
        return self.__copy__()

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return: """
        if self.val == sigma:
            return {sigmaP()}
        else:
            return {sigmaS()}

    def distDerivative(self, sigma):
        """
        :param sigma: an arbitrary symbol.
        :rtype: regular expression"""
        pd = self.partialDerivatives(sigma)
        if pd == set():
            return emptyset()
        elif len(pd) == 1:
            der = pd.pop()
            return der
        else:
            return sdisj(pd)

    def _linearFormC(self):
        """
        :return:"""
        lf = {}
        for sigma in self.Sigma:
            lf[sigma] = {sigmaS(self.Sigma)}
        return lf


class epsilon(specialConstant):
    """Class that represents the empty word.

    .. inheritance-diagram:: epsilon"""

    def __repr__(self):
        """
        :return: str"""
        return "epsilon()"

    def __str__(self):
        """
        :return: str"""
        return Epsilon

    _strP = __str__

    def rpn(self):
        """
        :return: str"""
        return Epsilon

    def __hash__(self):
        """
        :return: """
        return hash(Epsilon)

    @staticmethod
    def epsilonLength():
        return 1

    @staticmethod
    def epsilonP():
        """
        :rtype: bool"""
        return True

    @staticmethod
    def odot(sre, _):
        return sre

    @staticmethod
    def measure(from_parent=None):
        """
        :param from_parent:
        :return: measures"""
        if not from_parent:
            return [0, 1, 1, 0, 0, 0, 0, 0, 0]
        from_parent[1] += 1
        from_parent[2] += 1
        return from_parent

    @staticmethod
    def epsilonLength():
        """
        :rtype: int """
        return 1

    @staticmethod
    def ewp():
        """
        :rtype: bool"""
        return True

    def nfaThompson(self):
        """
        :rtype: NFA """
        aut = fa.NFA()
        s0 = aut.addState()
        s1 = aut.addState()
        aut.setInitial([s0])
        if self.Sigma is not None:
            aut.setSigma(self.Sigma)
        else:
            aut.setSigma([])
        aut.setFinal([s1])
        aut.addTransition(s0, Epsilon, s1)
        return aut

    def _nfaGlushkovStep(self, nfa, initial, final):
        """
        :param nfa:
        :param initial:
        :param final:
        :return: """
        final.update(initial)
        return initial, final

    def _nfaFollowEpsilonStep(self, conditions):
        """
        :param conditions:
        :return: """
        nfa, initial, final = conditions
        nfa.addTransition(initial, Epsilon, final)

    def snf(self, _hollowdot=False):
        """
        :param _hollowdot:
        :return: """
        if _hollowdot:
            return emptyset(self.Sigma)
        return self

    @staticmethod
    def partialDerivatives(_):
        """
        :return: """
        return set()

    def partialDerivativesC(self,_):
        """
        :param sigma:
        :return:"""
        return {sigmaS(self.Sigma)}

    def _dot(self, r):
        """
        :param r:
        :return:"""
        if self.Sigma and r.Sigma:
            r.Sigma = r.Sigma | self.Sigma
        return r


class emptyset(specialConstant):
    """Class that represents the empty set.

    .. inheritance-diagram:: emptyset"""

    def __repr__(self):
        """
        :return: """
        return "emptyset()"

    def __str__(self):
        """
        :return: """
        return EmptySet

    @staticmethod
    def odot(_, _a=None):
        return set()

    def rpn(self):
        """
        :return: """
        return EmptySet

    _strP = __str__

    def __hash__(self):
        """
        :return: """
        return hash(EmptySet)

    @staticmethod
    def emptysetP():
        """
        :return: """
        return True

    def epsilonP(self):
        """
        :return: """
        return False

    @staticmethod
    def measure(from_parent=None):
        """
        :param from_parent:
        :return: """
        if not from_parent:
            return [0, 1, 0, 0, 0, 0, 0, 0, 0]
        from_parent[1] += 1
        return from_parent

    def epsilonLength(self):
        """
        :return: """
        return 0

    def ewp(self):
        """
        :return: """
        return False

    def nfaThompson(self):
        aut = fa.NFA()
        s0 = aut.addState()
        s1 = aut.addState()
        aut.setInitial([s0])
        aut.setFinal([s1])
        if self.Sigma is not None:
            aut.setSigma(self.Sigma)
        return aut

    def _nfaGlushkovStep(self, nfa, initial, final):
        return initial, final

    def _nfaFollowEpsilonStep(self, conditions):
        pass

    def snf(self, _hollowdot=False):
        return self

    @staticmethod
    def partialDerivatives(sigma):
        return set()

    def partialDerivativesC(self, _):
        """
        :param sigma:
        :return:"""
        return {sigmaS(self.Sigma)}

    def _dot(self, r):
        """
        :param r:
        :return:"""
        if self.Sigma and r.Sigma:
            return emptyset(r.Sigma | self.Sigma)
        return self

    def _plus(self, r):
        """
        :param r:
        :return:"""
        if self.Sigma and r.Sigma:
            r.Sigma = r.Sigma | self.Sigma
        return r

    def _inter(self, r):
        """
        :param r:
        :return:"""
        if self.Sigma and r.Sigma:
            self.Sigma = r.Sigma | self.Sigma
        return self


class connective(regexp):
    """Base class for (binary) operations: concatenation, disjunction, etc

    .. inheritance-diagram:: connective"""

    def __init__(self, arg1, arg2, sigma=None):
        super(connective, self).__init__()
        self.arg1 = arg1
        self.arg2 = arg2
        self.Sigma = sigma

    def __repr__(self):
        return "%s(%s,%s)" % (self.__class__.__name__,
                              repr(self.arg1), repr(self.arg2))

    def __copy__(self):
        return self.__class__(self.arg1.__copy__(), self.arg2.__copy__(), copy.copy(self.Sigma))

    def _setSigma(self, s):
        self.arg1.setSigma(self.Sigma, s)
        self.arg2.setSigma(self.Sigma, s)

    @abstractmethod
    def mark(self):
        pass

    @abstractmethod
    def unmark(self):
        pass

    @abstractmethod
    def rpn(self):
        pass

    @abstractmethod
    def _follow(self):
        pass

    @abstractmethod
    def _memoLF(self):
        pass

    @abstractmethod
    def linearForm(self):
        pass

    @abstractmethod
    def snf(self):
        pass

    @abstractmethod
    def derivative(self):
        pass

    @abstractmethod
    def reduced(self):
        pass

    def unmarked(self):
        return self.__class__(self.arg1.unmarked(), self.arg2.unmarked())

    def _marked(self, pos):
        (r1, pos1) = self.arg1._marked(pos)
        (r2, pos2) = self.arg2._marked(pos1)
        return self.__class__(r1, r2), pos2

    def setOfSymbols(self):
        setOS = self.arg1.setOfSymbols()
        setOS.update(self.arg2.setOfSymbols())
        return setOS

    def measure(self, from_parent=None):
        if not from_parent:
            from_parent = 9*[0]
        measure = self.arg1.measure(from_parent)
        starh, measure[3] = measure[3], 0
        measure = self.arg2.measure(measure)
        measure[1] += 1
        measure[3] = max(measure[3], starh)
        if type(self) == disj:
                measure[4] += 1
        elif  type(self) == concat:
                measure[5] += 1
        elif type(self) == conj:
             measure[7] += 1
        elif type(self) == shuffle:
             measure[8] += 1
        return measure

    def alphabeticLength(self):
        return self.arg1.alphabeticLength() + self.arg2.alphabeticLength()

    def treeLength(self):
        return 1 + self.arg1.treeLength() + self.arg2.treeLength()

    def epsilonLength(self):
        return self.arg1.epsilonLength() + self.arg2.epsilonLength()

    def starHeight(self):
        return max(self.arg1.starHeight(), self.arg2.starHeight())

    def _cross(self, lists):
        """ Computes the pairs lastxfirst and firstxlast of the arguments

        :param lists:
        :return: pairs as a dictionary
        :rtype: dictionary"""
        for symbol in self.arg1.last():
            if symbol not in lists:
                lists[symbol] = self.arg2.first()
            else:
                lists[symbol] += self.arg2.first()
        for symbol in self.arg2.last():
            if symbol not in lists:
                lists[symbol] = self.arg1.first()
            else:
                lists[symbol] += self.arg1.first()
        return lists

    def first(self, parent_first=None):
        pass

    def last(self, parent_last=None):
        pass

    def followLists(self, lists=None):
        pass

    def followListsD(self, lists=None):
        pass

    def followListsStar(self, lists=None):
        pass


class disj(connective):
    """Class for disjuction operation on regular expressions.

    .. inheritance-diagram:: disj"""

    def __str__(self):
        return "%s + %s" % (self.arg1._strP(), self.arg2._strP())

    def _strP(self):
        return "(%s + %s)" % (self.arg1._strP(), self.arg2._strP())

    def mark(self):
        """ Convertion to marked atoms
        :rtype: disj """
        return disj(self.arg1.mark(), self.arg2.mark(), self.Sigma)

    def rpn(self):
        return "+%s%s" % (self.arg1.rpn(), self.arg2.rpn())

    def ewp(self):
        return self.arg1.ewp() or self.arg2.ewp()

    def unmark(self):
        """ Conversion back to unmarked atoms
        :rtype: disj """
        return disj(self.arg1.unmark(), self.arg2.unmark(), self.Sigma)

    def _final(self):
        """ Nipkow auxiliary function final
        :rtype: bool"""
        return self.arg1._final() or self.arg2._final()

    def _follow(self, flag):
        """ Nipkow follow function
        :type flag: bool
        :rtype: disj"""
        return disj(self.arg1._follow(flag), self.arg2._follow(flag), self.Sigma)

    def _read(self, val):
        """ Nipkow auxiliary function final

        :param val: symbol
        :returns: the p_regexp with all but val marks removed
        :rtype: disj """
        return disj(self.arg1._read(val), self.arg2._read(val), self.Sigma)

    def first(self, parent_first=None):
        parent_first = self.arg1.first(parent_first)
        return self.arg2.first(parent_first)

    def last(self, parent_last=None):
        parent_last = self.arg1.last(parent_last)
        return self.arg2.last(parent_last)

    def followLists(self, lists=None):
        if lists is None:
            lists = {}
        self.arg1.followLists(lists)
        return self.arg2.followLists(lists)

    def followListsD(self, lists=None):
        if lists is None:
            lists = {}
        self.arg1.followListsD(lists)
        return self.arg2.followListsD(lists)

    def followListsStar(self, lists=None):
        if lists is None:
            lists = {}
        self.arg1.followListsStar(lists)
        self.arg2.followListsStar(lists)
        return self._cross(lists)

    def reduced(self, hasEpsilon=False):
        left = self.arg1.reduced(hasEpsilon or self.arg2.ewp())
        right = self.arg2.reduced(hasEpsilon or left.ewp())
        if left.emptysetP():
            return right
        if right.emptysetP():
            return left
        if left.epsilonP() and (hasEpsilon or right.ewp()):
            return right
        if right.epsilonP() and (hasEpsilon or left.ewp()):
            return left
        if left is self.arg1 and right is self.arg2:
            return self
        reduced = disj(left, right, self.Sigma)
        reduced._reduced = True
        return reduced

    _reducedS = reduced

    def derivative(self, sigma):
        left = self.arg1.derivative(sigma)
        right = self.arg2.derivative(sigma)
        return disj(left, right, self.Sigma)

    def partialDerivatives(self, sigma):
        pdset = self.arg1.partialDerivatives(sigma)
        pdset.update(self.arg2.partialDerivatives(sigma))
        return pdset

    def linearForm(self):
        arg1_lf = self.arg1.linearForm()
        arg2_lf = self.arg2.linearForm()
        lf = {}
        for head in set(arg1_lf.keys() + arg2_lf.keys()):
            tails = arg1_lf.get(head, set()) | arg2_lf.get(head, set())
            if tails != set():
                lf[head] = tails
        return lf

    def support(self, side=True):
        p = self.arg1.support(side)
        p.update(self.arg2.support(side))
        return p

    def supportlast(self,side=True):
        p = self.arg1.supportlast(side)
        p.update(self.arg2.supportlast(side))
        return p

    def _delAttr(self, attr):
        if hasattr(self, attr):
            delattr(self, attr)
            self.arg1._delAttr(attr)
            self.arg2._delAttr(attr)

    def _memoLF(self):
        if hasattr(self, "_lf"):
            return
        self.arg1._memoLF()
        self.arg2._memoLF()
        self._lf = {}
        for head in self.arg1._lf:
            self._lf[head] = set(self.arg1._lf[head])
        for head in self.arg2._lf:
            try:
                self._lf[head].update(self.arg2._lf[head])
            except KeyError:
                self._lf[head] = set(self.arg2._lf[head])

    def tailForm(self):
        arg1 = self.arg1.tailForm()
        arg2 = self.arg2.tailForm()
        tf = {}
        for head in set(arg1.keys() + arg2.keys()):
            tails = arg1.get(head, set()) | arg2.get(head, set())
            if tails != set():
                tf[head] = tails
        return tf

    def snf(self, hollowdot=False):
        return disj(self.arg1.snf(hollowdot), self.arg2.snf(hollowdot), self.Sigma)

    def nfaThompson(self):
        """ Returns an NFA (Thompson) that accepts the RE.

    :rtype: NFA

    .. graphviz::

       digraph dij {
        "0" -> "si1" [label=e];
        "si1" -> "sf1" [label="arg1"];
        "sf1" -> "1" [label=e];
        "0" -> "si2" [label=e];
        "si2" -> "sf2" [label="arg2"];
        "sf2" -> "1" [label=e];
        }"""
        au = fa.NFA()
        if self.Sigma is not None:
            au.setSigma(self.Sigma)
        s0, s1 = au.addState(), au.addState()
        au.setInitial([s0])
        au.setFinal([s1])
        si1, sf1 = au._inc(self.arg1.nfaThompson())
        au.addTransition(s0, Epsilon, si1)
        au.addTransition(sf1, Epsilon, s1)
        si2, sf2 = au._inc(self.arg2.nfaThompson())
        au.addTransition(s0, Epsilon, si2)
        au.addTransition(sf2, Epsilon, s1)
        return au

    def _nfaGlushkovStep(self, nfa, initial, final):
        _, newFinal = self.arg1._nfaGlushkovStep(nfa, initial, set(final))
        _, final = self.arg2._nfaGlushkovStep(nfa, initial, final)
        final.update(newFinal)
        return initial, final

    def _nfaFollowEpsilonStep(self, conditions):
        self.arg1._nfaFollowEpsilonStep(conditions)
        self.arg2._nfaFollowEpsilonStep(conditions)

    def reversal(self):
        """ Reversal of regexp

        :rtype: reex.regexp"""
        return disj(self.arg1.reversal(), self.arg2.reversal(), sigma=self.Sigma)

class compl(regexp):
    """Class for not operation  on regular expressions.

    .. inheritance-diagram:: power"""

    def __init__(self, arg, sigma=None):
        super(compl, self).__init__()
        self.arg = arg
        self.Sigma = sigma

    def __str__(self):
        return "{0:s}({1:s})".format(Not,self.arg._strP())

    _strP = __str__

    def __repr__(self):
        return "compl({0:s})".format(repr(self.arg))

    def __copy__(self):
        return compl(copy.copy(self.arg),copy.copy(self.Sigma))

    def setOfSymbols(self):
        return self.arg.setOfSymbols()

    def reversal(self):
        """ Reversal of regexp

        :rtype: reex.regexp"""
        pass

    def mark(self):
        pass

    def snf(self):
        pass

    def rpn(self):
        pass

    def alphabeticLength(self):
        pass

    def derivative(self):
        pass

    def _follow(self):
        pass

    def unmark(self):
        pass

    def linearForm(self):
        pass

    def followListsD(self):
        pass

    def first(self):
        pass

    def followLists(self):
        pass

    def starHeight(self):
        pass

    def epsilonLength(self):
        pass

    def reduced(self):
        pass

    def _marked(self):
        pass

    def last(self):
        pass

    def treeLength(self):
        pass

    def _memoLF(self):
        pass

class power(regexp):
    """Class for power operation  on regular expressions.

    .. inheritance-diagram:: power"""

    def __init__(self, arg, n=1, sigma=None):
        super(power, self).__init__()
        self.arg = arg
        self.pw = n
        self.Sigma = sigma

    def __str__(self):
        return "%s^(%s)" % (self.arg._strP(), self.pw)

    _strP = __str__

    def __repr__(self):
        return "power(%s,%s)" % (repr(self.arg), repr(self.pw))

    def __copy__(self):
        return power(copy.copy(self.arg), self.pw, copy.copy(self.Sigma))

    def setOfSymbols(self):
        return self.arg.setOfSymbols()

    def reversal(self):
        """ Reversal of regexp

        :rtype: reex.regexp"""
        return power(self.arg.reversal(), self.pw, self.Sigma)

    def mark(self):
        pass

    def snf(self):
        pass

    def rpn(self):
        pass

    def alphabeticLength(self):
        pass

    def derivative(self):
        pass

    def _follow(self):
        pass

    def unmark(self):
        pass

    def linearForm(self):
        pass

    def followListsD(self):
        pass

    def first(self):
        pass

    def followLists(self):
        pass

    def starHeight(self):
        pass

    def epsilonLength(self):
        pass

    def reduced(self):
        pass

    def _marked(self):
        pass

    def last(self):
        pass

    def treeLength(self):
        pass

    def _memoLF(self):
        pass


class  option(regexp):
    """Class for option operation  on regular expressions.

    .. inheritance-diagram:: option"""

    def __init__(self, arg, sigma=None):
        super(option, self).__init__()
        self.arg = arg
        self.Sigma = sigma

    def __str__(self):
        return "({0:s})?".format(self.arg._strP())

    _strP = __str__

    def __repr__(self):
        return "option(%s)" % (repr(self.arg))

    def __copy__(self):
        return option(copy.copy(self.arg), copy.copy(self.Sigma))

    def setOfSymbols(self):
        return self.arg.setOfSymbols()

    def reversal(self):
        """ Reversal of regexp

        :rtype: reex.regexp"""
        return option(self.arg.reversal(), self.Sigma)

    def mark(self):
         return option(self.arg.mark(), self.Sigma)

    def snf(self, _hollowdot=False):
        if not _hollowdot:
            if self.arg.ewp():
                return self.arg.snf()
            return option(self.arg.snf(),self.Sigma)
        return self.arg.snf(True) #option(self.arg.snf(True),self.Sigma)

    def rpn(self):
        return "?{0:s}".format(self.arg.rpn())

    def alphabeticLength(self):
        return self.arg.alphabeticLength()

    def derivative(self,sigma):
        return self.arg.derivative(sigma)

    def _follow(self):
        pass

    def unmark(self):
        return option(self.arg.unmark(), self.Sigma)

    def linearForm(self):
        return self.arg.linearForm()


    def first(self, parent_first=None):
        return self.arg.first(parent_first)

    def followLists(self,lists=None):
        return  self.arg.followLists(lists)

    def followListsD(self, lists=None):
        return self.arg.followLists(lists)

    def followListsStar(self, lists=None):
        """to be fixed """
        return self.arg.followListsStar(lists)

    def starHeight(self):
        return self.arg.starHeight()

    def epsilonLength(self):
        return 1+ self.arg.epsilonLength()

    def reduced(self):
        return option(self.arg.reduced())

    def unmarked(self):
        return option(self.arg.unmarked())

    def _marked(self,pos):
        (r1, pos1) = self.arg._marked(pos)
        return option(r1), pos1

    def last(self, parent_first=None):
        return self.arg.last(parent_first)

    def treeLength(self):
        return self.arg.treeLength()+1

    def _memoLF(self):
        if hasattr(self, "_lf"):
            return
        self.arg._memoLF()
        self._lf = self.arg._lf

    def _setSigma(self, s):
        self.arg.setSigma(self.Sigma, s)

    def partialDerivatives(self, sigma):
         return self.arg.partialDerivatives(sigma)

    def support(self, side=True):
        return self.arg.support(side)

    def supportlast(self, side=True):
        return self.arg.supportlast(side)

    def ewp(self):
        return True

    def nfaThompson(self):
        """ Returns a NFA that accepts the RE.

    :rtype: NFA

    .. graphviz::

       digraph foo {
        "0" -> "1" [label=e];
        "0" -> "a" [label=e];
        "a" -> "b" [label=A];
        "b" -> "1" [label=e];
        }"""

        sun = self.arg.nfaThompson()
        au = sun.dup()
        (s0, s1) = (au.addState(), au.addState())
        if self.Sigma is not None:
            au.setSigma(self.Sigma)
        au_initial = au.Initial.pop()
        au.addTransition(s0, Epsilon, s1)
        au.addTransition(s0, Epsilon, au_initial)
        au.addTransition(list(au.Final)[0], Epsilon, s1)  # we know by contruction
        au.setInitial([s0])  # that there is only one final state,
        au.setFinal([s1])  # and only one initial state
        return au

    def _nfaGlushkovStep(self, nfa, initial, final):
        _, final = self.arg._nfaGlushkovStep(nfa, initial, final)
        final.update(initial)
        return initial, final

    def _nfaFollowEpsilonStep(self, conditions):
        nfa, initial, final = conditions
        self.arg._nfaFollowEpsilonStep((nfa, initial, final))
        if nfa.hasTransitionP(initial, Epsilon, final):
             return
        nfa.addTransition(initial, Epsilon, final)


class star(regexp):
    """Class for iteration operation (aka Kleene star, or Kleene closure) on regular expressions.

    .. inheritance-diagram:: star"""

    def mark(self):
        return star(self.arg.mark(), self.Sigma)

    def __init__(self, arg, sigma=None):
        super(star, self).__init__()
        self.arg = arg
        self.Sigma = sigma

    def __str__(self):
        return "%s*" % self.arg._strP()

    _strP = __str__

    def __repr__(self):
        return "star(%s)" % repr(self.arg)

    def __copy__(self):
        return star(copy.copy(self.arg), copy.copy(self.Sigma))

    def unmark(self):
        """ Conversion back to regexp

        :rtype: reex.star"""
        return star(self.arg.unmark(), self.Sigma)

    def _final(self):
        """ Nipkow auxiliary function final

        :rtype: bool"""
        return self.arg._final()

    def _follow(self, flag):
        """ Nipkow follow function

        :type flag: bool
        :rtype: emptyset"""
        return star(self.arg._follow(self.arg._final() or flag), self.Sigma)

    def _read(self, val):
        """ Nipkow auxiliary function final

        :param val: symbol
        :returns: the p_regexp with all but val marks removed
        :rtype: star """
        return star(self.arg._read(val), self.Sigma)

    def rpn(self):
        return "*%s" % self.arg.rpn()

    def setOfSymbols(self):
        return self.arg.setOfSymbols()

    def _setSigma(self, s):
        self.arg.setSigma(self.Sigma, s)

    def measure(self, from_parent=None):
        if not from_parent:
            from_parent = 9*[0]
        measure = self.arg.measure(from_parent)
        measure[1] += 1
        measure[3] += 1
        measure[6] += 1
        return measure

    def alphabeticLength(self):
        return self.arg.alphabeticLength()

    def treeLength(self):
        return 1 + self.arg.treeLength()

    def epsilonLength(self):
        return self.arg.epsilonLength()

    def starHeight(self):
        return 1 + self.arg.starHeight()

    def first(self, parent_first=None):
        return self.arg.first(parent_first)

    def last(self, parent_first=None):
        return self.arg.last(parent_first)

    def followLists(self, lists=None):
        lists = self.arg.followLists(lists)
        for symbol in self.arg.last():
            if symbol not in lists:
                lists[symbol] = self.arg.first()
            else:
                lists[symbol] += self.arg.first()
        return lists

    def followListsD(self, lists=None):
        return self.arg.followListsStar(lists)

    def followListsStar(self, lists=None):
        return self.arg.followListsStar(lists)

    def unmarked(self):
        return star(self.arg.unmarked())

    def _marked(self, pos):
        (r1, pos1) = self.arg._marked(pos)
        return star(r1), pos1

    def reduced(self, hasEpsilon=False):
        rarg = self.arg._reducedS(True)
        if rarg.epsilonP() or rarg.emptysetP():
            return epsilon(self.Sigma)
        if self.arg is rarg:
            return self
        reduced = star(rarg, self.Sigma)
        return reduced

    # noinspection PyUnusedLocal
    def _reducedS(self, hasEpsilon=False):
        return self.arg._reducedS(True)

    def derivative(self, sigma):
        d = self.arg.derivative(sigma)
        return concat(d, self, self.Sigma)

    def partialDerivatives(self, sigma):
        arg_pdset = self.arg.partialDerivatives(sigma)
        pds = set()
        for pd in arg_pdset:
            if pd.emptysetP():
                pds.add(emptyset(self.Sigma))
            elif pd.epsilonP():
                pds.add(self)
            else:
                pds.add(concat(pd, self, self.Sigma))
        return pds

    def linearForm(self):
        arg_lf = self.arg.linearForm()
        lf = {}
        for head in arg_lf:
            lf[head] = set()
            for tail in arg_lf[head]:
                if tail.emptysetP():
                    lf[head].add(emptyset(self.Sigma))
                elif tail.epsilonP():
                    lf[head].add(self)
                else:
                    lf[head].add(concat(tail, self, self.Sigma))
        return lf

    def support(self,side=True):
        return self._odot(self.arg.support(side),side)

    def supportlast(self,side=True):
        return self._odot(self.arg.supportlast(side),side)

    def _delAttr(self, attr):
        if hasattr(self, attr):
            delattr(self, attr)
            self.arg._delAttr(attr)

    def _memoLF(self):
        if hasattr(self, "_lf"):
            return
        self.arg._memoLF()
        self._lf = {}
        for head in self.arg._lf:
            pd_set = set()
            self._lf[head] = pd_set
            for tail in self.arg._lf[head]:
                if tail.emptysetP():
                    pd_set.add(emptyset(self.Sigma))
                elif tail.epsilonP():
                    pd_set.add(self)
                else:
                    pd_set.add(concat(tail, self, self.Sigma))

    def ewp(self):
        return True

    def tailForm(self):
        arg_tf = self.arg.tailForm()
        tf = {}
        for tail in arg_tf:
            tf[tail] = set()
            for head, head1 in arg_tf[tail]:
                if head.emptysetP():
                    tf[tail].add((emptyset(self.Sigma),emptyset(self.Sigma)))
                elif head.epsilonP():
                    tf[tail].add((self,self))
                else:
                    tf[tail].add((concat(self, head , self.Sigma),concat(self, head1 , self.Sigma)) )
        return tf

    def snf(self, _hollowdot=False):
        if _hollowdot:
            return self.arg.snf(True)
        return star(self.arg.snf(True), self.Sigma)

    def nfaThompson(self):
        """ Returns a NFA that accepts the RE.

    :rtype: NFA

    .. graphviz::

       digraph foo {
        "0" -> "1" [label=e];
        "0" -> "a" [label=e];
        "a" -> "b" [label=A];
        "b" -> "1" [label=e];
        "1" -> "0" [label=e];
        }"""

        sun = self.arg.nfaThompson()
        au = sun.dup()
        (s0, s1) = (au.addState(), au.addState())
        if self.Sigma is not None:
            au.setSigma(self.Sigma)
        au_initial = au.Initial.pop()
        au.addTransition(s0, Epsilon, s1)
        au.addTransition(s1, Epsilon, s0)
#        au.addTransition(list(au.Final)[0], Epsilon, au_initial)
        au.addTransition(s0, Epsilon, au_initial)
        au.addTransition(list(au.Final)[0], Epsilon, s1)  # we know by contruction
        au.setInitial([s0])  # that there is only one final state,
        au.setFinal([s1])  # and only one initial state
        return au

    def _nfaGlushkovStep(self, nfa, initial, final):
        previous_trans = {}
        for i_state in initial:
            if i_state in nfa.delta:
                previous_trans[i_state] = nfa.delta[i_state]
                del nfa.delta[i_state]
        new_initial, final = self.arg._nfaGlushkovStep(nfa, initial, final)
        for i_state in initial:
            if i_state in nfa.delta:
                for symbol in nfa.delta[i_state]:
                    for target in nfa.delta[i_state][symbol]:
                        for f_state in final:
                            nfa.addTransition(f_state, symbol, target)
        for i_state in previous_trans:
            for sym in previous_trans[i_state]:
                for target in previous_trans[i_state][sym]:
                    nfa.addTransition(i_state, sym, target)
        final.update(initial)
        return new_initial, final

    def _nfaFollowEpsilonStep(self, conditions):
        nfa, initial, final = conditions
        if initial is final:
            iter_state = final
        else:
            iter_state = nfa.addState()
        self.arg._nfaFollowEpsilonStep((nfa, iter_state, iter_state))
        tomerge = nfa.epsilonPaths(iter_state, iter_state)
        nfa.mergeStatesSet(tomerge)
        if initial is not final:
            nfa.addTransition(initial, Epsilon, iter_state)
            nfa.addTransition(iter_state, Epsilon, final)

    def reversal(self):
        """Reversal of regexp

        :rtype: reex.regexp"""
        return star(self.arg.reversal(), sigma=self.Sigma)


class concat(connective):
    """Class for catenation operation on regular expressions.

    .. inheritance-diagram:: concat"""

    def __str__(self):
        return "%s %s" % (self.arg1._strP(), self.arg2._strP())

    def _strP(self):
        return "(%s %s)" % (self.arg1._strP(), self.arg2._strP())

    def mark(self):
        return concat(self.arg1.mark(), self.arg2.mark(), self.Sigma)

    def rpn(self):
        """
        :rtype: str"""
        return ".%s%s" % (self.arg1.rpn(), self.arg2.rpn())

    def ewp(self):
        return self.arg1.ewp() and self.arg2.ewp()

    def first(self, parent_first=None):
        if self.arg1.ewp():
            return self.arg2.first(self.arg1.first(parent_first))
        else:
            return self.arg1.first(parent_first)

    def last(self, parent_last=None):
        if self.arg2.ewp():
            return self.arg2.last(self.arg1.last(parent_last))
        else:
            return self.arg2.last(parent_last)

    def followLists(self, lists=None):
        lists = self.arg1.followLists(lists)
        self.arg2.followLists(lists)
        for symbol in self.arg1.last():
            if symbol not in lists:
                lists[symbol] = self.arg2.first()
            else:
                lists[symbol] += self.arg2.first()
        return lists

    def followListsD(self, lists=None):
        lists = self.arg1.followListsD(lists)
        self.arg2.followListsD(lists)
        for symbol in self.arg1.last():
            if symbol not in lists:
                lists[symbol] = self.arg2.first()
            else:
                lists[symbol] += self.arg2.first()
        return lists

    def followListsStar(self, lists=None):
        if lists is None:
            lists = {}
        if self.arg1.ewp():
            if self.arg2.ewp():
                self.arg1.followListsStar(lists)
                self.arg2.followListsStar(lists)
            else:
                self.arg1.followListsD(lists)
                self.arg2.followListsStar(lists)
        elif self.arg2.ewp():
            self.arg1.followListsStar(lists)
            self.arg2.followListsD(lists)
        else:
            self.arg1.followListsD(lists)
            self.arg2.followListsD(lists)
        return self._cross(lists)

    def reduced(self, hasEpsilon=False):
        left = self.arg1.reduced()
        right = self.arg2.reduced()
        if left.emptysetP() or right.emptysetP():
            return emptyset(self.Sigma)
        if left.epsilonP():
            if hasEpsilon:
                return self.arg2.reduced(True)
            return right
        if right.epsilonP():
            if hasEpsilon:
                return self.arg1.reduced(True)
            return left
        if left is self.arg1 and right is self.arg2:
            return self
        reduced = concat(left, right, self.Sigma)
        return reduced

    _reducedS = reduced

    def derivative(self, sigma):
        left = concat(self.arg1.derivative(sigma), self.arg2, self.Sigma)
        if self.arg1.ewp():
            right = self.arg2.derivative(sigma)
            return disj(left, right, self.Sigma)
        return left

    def partialDerivatives(self, sigma):
        pds = set()
        for pd in self.arg1.partialDerivatives(sigma):
            if pd.emptysetP():
                pds.add(emptyset(self.Sigma))
            elif pd.epsilonP():
                pds.add(self.arg2)
            else:
                pds.add(concat(pd, self.arg2, self.Sigma))
        if self.arg1.ewp():
            pds.update(self.arg2.partialDerivatives(sigma))
        return pds

    def linearForm(self):
        arg1_lf = self.arg1.linearForm()
        lf = {}
        for head in arg1_lf:
            lf[head] = set()
            for tail in arg1_lf[head]:
                if tail.emptysetP():
                    lf[head].add(emptyset(self.Sigma))
                elif tail.epsilonP():
                    lf[head].add(self.arg2)
                else:
                    lf[head].add(concat(tail, self.arg2, self.Sigma))
        if self.arg1.ewp():
            arg2_lf = self.arg2.linearForm()
            for head in arg2_lf:
                if head in lf:
                    lf[head].update(arg2_lf[head])
                else:
                    lf[head] = set(arg2_lf[head])
        return lf

    def _memoLF(self):
        if hasattr(self, "_lf"):
            return
        self.arg1._memoLF()
        self._lf = {}
        for head in self.arg1._lf:
            pd_set = set()
            self._lf[head] = pd_set
            for tail in self.arg1._lf[head]:
                if tail.emptysetP():
                    pd_set.add(emptyset(self.Sigma))
                elif tail.epsilonP():
                    pd_set.add(self.arg2)
                else:
                    pd_set.add(concat(tail, self.arg2, self.Sigma))
        if self.arg1.ewp():
            self.arg2._memoLF()
            for head in self.arg2._lf:
                if head in self._lf:
                    self._lf[head].update(self.arg2._lf[head])
                else:
                    self._lf[head] = set(self.arg2._lf[head])

    def support(self, side=True):
        if side:
            arg2 = self.arg2
            arg1 = self.arg1
        else:
            arg2 = self.arg1
            arg1 = self.arg2
        p = arg2._odot(arg1.support(side), side)
        p.update(arg2.support(side))
        return p

    def supportlast(self, side=True):
        if side:
            arg2 = self.arg2
            arg1 = self.arg1
        else:
            arg2 = self.arg1
            arg1 = self.arg2
        p = arg2.supportlast(side)
        if arg2.ewp():
            p.update(arg2._odot(arg1.supportlast(side), side))
        return p

    def tailForm(self):
        arg2_tf = self.arg2.tailForm()
        tf = {}
        for head in arg2_tf:
            tf[head] = set()
            for tail , tail1 in arg2_tf[head]:
                if tail.emptysetP():
                    tf[head].add((emptyset(self.Sigma),emptyset(self.Sigma)) )
                elif tail.epsilonP():
                    tf[head].add((self.arg1, self.arg1))
                else:
                    tf[head].add((concat(self.arg1, tail, self.Sigma), concat(self.arg1, tail1, self.Sigma)))
        if self.arg2.ewp():
            arg1_tf = self.arg1.tailForm()
            for head in arg1_tf:
                if head in tf:
                    tf[head].update(arg1_tf[head])
                else:
                    tf[head] = set(arg1_tf[head])
        return tf

    def snf(self, _hollowdot=False):
        if not _hollowdot:
            return concat(self.arg1.snf(), self.arg2.snf(), self.Sigma)
        if self.ewp():
            return disj(self.arg1.snf(True), self.arg2.snf(True), self.Sigma)
        if self.arg1.ewp():
            return concat(self.arg1.snf(), self.arg2.snf(True), self.Sigma)
        if self.arg2.ewp():
            return concat(self.arg1.snf(True), self.arg2.snf(), self.Sigma)
        return concat(self.arg1.snf(), self.arg2.snf(), self.Sigma)

    def nfaThompson(self):  # >(0)--arg1-->(1)--->(2)--arg2-->((3))
        au = fa.NFA()
        if self.Sigma is not None:
            au.setSigma(self.Sigma)
        s0, s1 = au._inc(self.arg1.nfaThompson())
        s2, s3 = au._inc(self.arg2.nfaThompson())
        au.setInitial([s0])
        au.setFinal([s3])
        au.addTransition(s1, Epsilon, s2)
        return au

    def _nfaGlushkovStep(self, nfa, initial, final):
        initial, final = self.arg1._nfaGlushkovStep(nfa, initial, final)
        return self.arg2._nfaGlushkovStep(nfa, final, set())

    def _nfaFollowEpsilonStep(self, conditions):
        nfa, initial, final = conditions
        interm = nfa.addState()
        self.arg1._nfaFollowEpsilonStep((nfa, initial, interm))
        # At this stage, if the intermediate state has a single
        # incoming transition, and it's through Epsilon, then the
        # source becomes the new intermediate state:
        new_interm = nfa.unlinkSoleIncoming(interm)
        if new_interm is not None:
            interm = new_interm
        self.arg2._nfaFollowEpsilonStep((nfa, interm, final))
        # At this stage, if the intermediate state has a single
        # outgoing transition, and it's through Epsilon, then we merge
        # it with the target.
        if nfa.hasTransitionP(interm, Epsilon, final):
            return
        target = nfa.unlinkSoleOutgoing(interm)
        if target is not None:
            nfa.mergeStates(target, interm)

    def reversal(self):
        """Reversal of regexp

        :rtype: reex.regexp"""
        return concat(self.arg2.reversal(), self.arg1.reversal(), sigma=self.Sigma)

    def unmark(self):
        """ Conversion back to unmarked atoms
        :rtype: concat """
        return concat(self.arg1.unmark, self.arg2.unmark, self.Sigma)

    def _final(self):
        """ Nipkow auxiliary function final
        :rtype: bool"""
        return self.arg2._final() or (self.arg2.ewp() and self.arg1._final())

    def _follow(self, flag):
        """ Nipkow follow function
        :type flag: bool
        :rtype: emptyset"""
        return concat(self.arg1._follow(flag), self.arg2._follow(self.arg1._final() or (flag and self.arg1.ewp())),
                      self.Sigma)

    def _read(self, val):
        """ Nipkow auxiliary function final

        :param val: symbol
        :returns: the p_regexp with all but val marks removed
        :rtype: concat """
        return concat(self.arg1._read(val), self.arg2._read(val), self.Sigma)


class shuffle(connective):
    """Shuffle operation of regexps
    """

    def __str__(self):
        return "{1:s} {0:s} {2:s}".format(Shuffle, self.arg1._strP(), self.arg2._strP())

    def _strP(self):
        return "({1:s} {0:s}  {2:s})".format(Shuffle, self.arg1._strP(), self.arg2._strP())

    def rpn(self):
        return "{0:s}{0:s}{1:s}".format(Shuffle, self.arg1.rpn(), self.arg2.rpn())

    def ewp(self):
        return self.arg1.ewp() and self.arg2.ewp()

    def reduced(self, hasEpsilon=False):
        left = self.arg1.reduced()
        right = self.arg2.reduced()
        if left.emptysetP() or right.emptysetP():
            return emptyset(self.Sigma)
        if left.epsilonP():
            if hasEpsilon:
                return self.arg2.reduced(True)
            return right
        if right.epsilonP():
            if hasEpsilon:
                return self.arg1.reduced(True)
            return left
        if left is self.arg1 and right is self.arg2:
            return self
        reduced = shuffle(left, right, self.Sigma)
#        reduced._reduced = True
        return reduced

    _reducedS = reduced

    def _memoLF(self):
        raise regexpInvalidMethod()

    def snf(self):
        raise regexpInvalidMethod()

    def mark(self):
        raise regexpInvalidMethod()

    def unmark(self):
        raise regexpInvalidMethod()

    def _follow(self):
        raise regexpInvalidMethod()

    def derivative(self,sigma):
        return disj(shuffle(self.arg1.derivative(sigma),self.arg2,self.Sigma), shuffle(self.arg1,self.arg2.derivative(sigma),self.Sigma),self.Sigma)

    def partialDerivatives(self, sigma):
        pdset = self.arg1.partialDerivatives(sigma)
        a1 = {_dotshuffle(a, self.arg2,self.Sigma) for a in pdset}
        pd2set = self.arg2.partialDerivatives(sigma)
        a1.update({_dotshuffle(self.arg1, a, self.Sigma) for a in pd2set})
        return a1

    def support(self, side= True):
        """ """
        p = self.arg1.support(side)
        q = self.arg2.support(side)
        p0 = _odotshuffle(p, q, self.Sigma)
        p0.update(_odotshuffle({self.arg1}, q, self.Sigma))
        p0.update(_odotshuffle(p, {self.arg2}, self.Sigma))
        return p0


    def supportlast(self, side=True):
        """ """
        p = self.arg1.supportlast()
        q = self.arg2.supportlast()
        p0 = _odotshuffle(p, q, self.Sigma)
        if self.arg1.ewp():
            p0.update(_odotshuffle({self.arg1}, q, self.Sigma))
        if self.arg2.ewp():
            p0.update(_odotshuffle(p, {self.arg2}, self.Sigma))
        return p0

    def linearForm(self):
        arg1_lf = self.arg1.linearForm()
        arg2_lf = self.arg2.linearForm()
        lf = {}
        for head in arg1_lf:
            lf[head] = set()
            for tail in arg1_lf[head]:
                lf[head].add(_dotshuffle(tail, self.arg2, self.Sigma))
        for head in arg2_lf:
            if head in lf:
                lf[head].update({_dotshuffle(self.arg1, tail, self.Sigma) for tail in arg2_lf[head]})
            else:
                lf[head] = set()
                for tail in arg2_lf[head]:
                    lf[head].add(_dotshuffle(self.arg1, tail, self.Sigma))
        return lf

    def reversal(self):
        return shuffle(self.arg1.reversal(), self.arg2.reversal(), sigma=self.Sigma)


class conj(connective):
    """ Intersection operation of regexps
    """

    def _follow(self):
        raise regexpInvalidMethod()

    def derivative(self):
        raise regexpInvalidMethod()

    def unmark(self):
        raise regexpInvalidMethod()

    def mark(self):
        raise regexpInvalidMethod()

    def snf(self):
        raise regexpInvalidMethod()

    def _memoLF(self):
        raise regexpInvalidMethod()

    def __str__(self):
        return "{1:s} {0:s} {2:s}".format(Conj, self.arg1._strP(), self.arg2._strP())

    def _strP(self):
        return "({1:s} {0:s}  {2:s})".format(Conj, self.arg1._strP(), self.arg2._strP())

    def rpn(self):
        return "{0:s}{0:s}{1:s}".format(Conj, self.arg1.rpn(), self.arg2.rpn())

    def ewp(self):
        return self.arg1.ewp() and self.arg2.ewp()

    def reduced(self, hasEpsilon=False):
        left = self.arg1.reduced()
        right = self.arg2.reduced()
        if left.emptysetP() or right.emptysetP():
            return emptyset(self.Sigma)
        if left.epsilonP():
            if hasEpsilon:
                return self.arg2.reduced(True)
            return right
        if right.epsilonP():
            if hasEpsilon:
                return self.arg1.reduced(True)
            return left
        if left is self.arg1 and right is self.arg2:
            return self
        reduced = conj(left, right, self.Sigma)
#        reduced._reduced = True
        return reduced

    _reducedS = reduced

    def partialDerivatives(self, sigma):
        pdset = self.arg1.partialDerivatives(sigma)
        pd2set = self.arg2.partialDerivatives(sigma)
        return _odotconj(pdset, pd2set, self.Sigma)

    def support(self, side=True):
        """ """
        p = self.arg1.support(side)
        q = self.arg2.support(side)
        return _odotconj(p, q, self.Sigma)

    def linearForm(self):
        arg1_lf = self.arg1.linearForm()
        arg2_lf = self.arg2.linearForm()
        lf = {}
        for head in set(arg1_lf.keys()) & set(arg2_lf.keys()):
            lf[head] = _odotconj(arg1_lf[head], arg2_lf[head], self.Sigma)
        return lf

    def reversal(self):
        return conj(self.arg1.reversal(), self.arg2.reversal(), sigma=self.Sigma)


class position(atom):
    """Class for marked regular expression symbols.

    .. inheritance-diagram:: position"""

    def unmark(self):
        raise regexpInvalidMethod()

    def _follow(self, flag):
        raise regexpInvalidMethod()

    def __repr__(self):
        return "position%s" % repr(self.val)

    def __copy__(self):
        return position(self.val)

    def setOfSymbols(self):
        return {self.val}

    def unmarked(self):
        return atom(self.val[0])

    def symbol(self):
        return self.val[0]


class sigmaS(specialConstant):
    """
    Special regular expressions modulo associativity, commutativity, idempotence of disjunction and intersection;
      associativity of concatenation; identities Sigma^* and Sigma^+.

       sigmaS: Class that represents the complement of the emptyset set (Sigma^*)

    .. seealso: sconnective

    .. inheritance-diagram:: sigmaS
    """

    def __hash__(self):
         return hash(type(self))

    def __repr__(self):
        """
        :return:"""
        if self.Sigma is not None:
            return "sigmaS({0:s})".format(self.Sigma)
        return "sigmaS()"

    def __str__(self):
        """
        :return:"""
        return SigmaS

    _strP = __str__

    def __eq__(self, other):
        return self.Sigma == other.Sigma and type(self) == type(other)

    def ewp(self):
        """
        :return:"""
        return True

    def linearForm(self):
        """
        :return:"""
        lf = {}
        for sigma in self.Sigma:
            lf[sigma] = {self}
        return lf

    def linearFormC(self):
        """
        :return:"""
        return {}

    def derivative(self, sigma):
        """
        :param sigma:
        :return:"""
        return self

    def partialDerivatives(self, sigma):
        """
        :param sigma:
        :return:"""
        return {self}

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return:"""
        return set()

    def support(self, side=True):
        """
        :return: """
        return {self}

    def _plus(self, r):
        """
        :param: r
        :return: """
        if self.Sigma and r.Sigma:
            self.Sigma = r.Sigma | self.Sigma
        return self

    def _inter(self,r):
        """
        :param: r
        :return: """
        if self.Sigma and r.Sigma:
            r.Sigma = r.Sigma | self.Sigma
        return r


class sigmaP(specialConstant):
    """
    Special regular expressions modulo associativity, commutativity, idempotence of disjunction and intersection;
      associativity of concatenation; identities Sigma^* and Sigma^+.

       sigmaP: Class that represents the complement of the emptyset word (Sigma^+)

    .. seealso: sconnective
    .. inheritance-diagram:: sigmaP
      """
    def __hash__(self):
         return hash(type(self))

    def __repr__(self):
        """
        :return:"""
        if self.Sigma is not None:
            return "sigmaP({0:s})".format(self.Sigma)
        return "sigmaP()"

    def __str__(self):
        """
        :return:"""
        return SigmaP

    _strP = __str__

    # def __eq__(self, other):
    #     return self.Sigma == other.Sigma and type(self) == type(other)

    def ewp(self):
        """
        :return: """
        return False

    def derivative(self, sigma):
        """
        :param sigma:
        :return: """
        return sigmaS(self.Sigma)

    def partialDerivatives(self, sigma):
        """
        :param sigma:
        :return: """
        return {sigmaS(self.Sigma)}

    @staticmethod
    def partialDerivativesC(_):
        """
        :param _:
        :return: """
        return set()

    def linearForm(self):
        """
        :return:"""
        lf = {}
        for sigma in self.Sigma:
            lf[sigma] = {sigmaS(self.Sigma)}
        return lf

    def linearFormC(self):
        """
        :return: """
        return {}

    def support(self, side=True):
        """
        :return: """
        return {sigmaS(self.Sigma)}


class sconnective(regexp):
    """ Special regular expressions modulo associativity, commutativity, idempotence of disjunction and intersection;
      associativity of concatenation; identities Sigma^* and Sigma^+. Connectives are:
       sdisj: disjunction
       sconj: intersection
       sconcat: concatenation

       For parsing use str2sre

     .. seealso:  Manipulation of Extended Regular expressions. Rafaela Bastos, Msc Thesis 2015
                    http://www.dcc.fc.up.pt/~nam/web/resources/rafaelamsc.pdf

     .. inheritance-diagram:: sconnective
    """
    def __init__(self, arg, sigma=None):
        super(sconnective, self).__init__()
        self.arg = arg
        self.Sigma = sigma
        self.hash = None

    def __hash__(self):
         if self.hash:
             return self.hash
         else:
             h = hash((self.arg, type(self)))
             self.hash = h
             return h

    def __eq__(self, other):
        return hash(self) == hash(other)

    def __len__(self):
        """
        :return: """
        return len(self.arg)

    def mark(self):
        raise regexpInvalidMethod()

    def snf(self):
        raise regexpInvalidMethod()

    def rpn(self):
        raise regexpInvalidMethod()

    def derivative(self):
        raise regexpInvalidMethod()

    def _follow(self):
        raise regexpInvalidMethod()

    def unmark(self):
        raise regexpInvalidMethod()

    def linearForm(self):
        raise regexpInvalidMethod()

    def followListsD(self):
        raise regexpInvalidMethod()

    def first(self):
        raise regexpInvalidMethod()

    def starHeight(self):
        raise regexpInvalidMethod()

    def followLists(self):
        raise regexpInvalidMethod()

    def reduced(self):
        raise regexpInvalidMethod()

    def _marked(self):
        raise regexpInvalidMethod()

    def last(self):
        raise regexpInvalidMethod()

    def _memoLF(self):
        raise regexpInvalidMethod()

    def alphabeticLength(self):
        """
        :return: """
        length = 0
        for i in self.arg:
            length += i.alphabeticLength()
        return length

    def epsilonLength(self):
        """
        :return: """
        length = 0
        for i in self.arg:
            length += i.epsilonLength()
        return length

    def treeLength(self):
        """
        :return: """
        length = 0
        for i in self.arg:
            length += i.treeLength()
        return length + 1

    def syntacticLength(self):
        """
        :return: """
        length = len(self.arg) - 1
        for i in self.arg:
            length += i.syntacticLength()
        return length

    def setOfSymbols(self):
        """
        :return: """
        s = set()
        for i in self.arg:
            s = s | i.setOfSymbols()
        return s

    def _setSigma(self,s):
        self.Sigma = s
        for r in self.arg:
            r.setSigma(s)


class sconcat(sconnective):

    """Class that represents the concatenation operation.

    .. inheritance-diagram:: concat
    """

    def __str__(self):
        """
        :return: """
        return "{0:s}".format(self._strP())

    def _strP(self):
        """
        :return: """
        rep = ""
        for i in self.arg:
            rep += "{0:s}".format(str(i))
        return rep

    def __repr__(self):
        """
        :return: """
        return "sconcat({0:s})".format(repr(self.arg))

    def ewp(self):
        """
        :return: """
        for i in self.arg:
            if not (i.ewp()):
                return False
        return True

    def head(self):
        """
        :return: """
        re1 = self.arg[0]
        re1.setSigma(self.Sigma)
        return re1

    def tail(self):
        """
        :return: """
        if len(self.arg) == 2:
            re1 = self.arg[1]
            re1.setSigma(self.Sigma)
            return re1
        else:
            re1 = sconcat(self.arg[1:])
            re1.setSigma(self.Sigma)
            return re1

    def head_rev(self):
        """
        :return: """
        re1 = self.arg[-1]
        re1.setSigma(self.Sigma)
        return re1

    def tail_rev(self):
        """
        :return: """
        if len(self.arg) == 2:
            re1 = self.arg[0]
            re1.setSigma(self.Sigma)
            return re1
        else:
            re1 = sconcat(self.arg[:-1])
            re1.setSigma(self.Sigma)
            return re1

    def derivative(self, sigma):
        """
        :param sigma:
        :return: """
        head = self.head()
        tail = self.tail()
        der = head.derivative(sigma)._dot(tail)
        if head.ewp():
            der_tail = tail.derivative(sigma)
            return der._plus(der_tail)
        return der

    def partialDerivatives(self, sigma):
        """
        :param sigma:
        :return: """
        head = self.head()
        tail = self.tail()
        pd_head = head.partialDerivatives(sigma)
        pd = concat_set(pd_head, tail)
        if head.ewp():
            pd_tail = tail.partialDerivatives(sigma)
            return pd | pd_tail
        else:
            return pd

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return: """
        head = self.head()
        tail = self.tail()
        pd_head = head.partialDerivatives(sigma)
        pd = negation_set(concat_set(pd_head, tail), self.Sigma)
        if head.ewp():
            pd_tail = tail.partialDerivativesC(sigma)
            return intersection_set(pd, pd_tail)
        else:
            return pd

    def linearFormC(self):
        """
        :return: """
        head = self.head()
        tail = self.tail()
        lf_head = head.linearForm()
        lf = negation_mon(concat_mon(lf_head, tail), self.Sigma)
        if head.ewp():
            lfc_tail = tail.linearFormC()
            return intersection_mon(lf, lfc_tail)
        return lf

    def linearForm(self):
        """
        :return: """
        head = self.head()
        tail = self.tail()
        lf_head = head.linearForm()
        lf = concat_mon(lf_head, tail)
        if head.ewp():
            lf_tail = tail.linearForm()
            return union_mon(lf, lf_tail)
        return lf

    def support(self, side=True):
        """
        :return: """
        head = self.head()
        tail = self.tail()
        pi = concat_set(head.support(side), tail)
        return pi | tail.support(side)

    def _dot(self, r):
        """
        :param r:
        :return: """
        if type(r) is epsilon or type(r) is emptyset:
            return r._dot(self)
        if type(r) is sconcat:
            r_conc = sconcat(self.arg + r.arg)
            if self.Sigma and r.Sigma:
                r_conc.Sigma = self.Sigma | r.Sigma
            return r_conc
        else:
            r_conc = sconcat(self.arg + (r,))
            if self.Sigma and r.Sigma:
                r_conc.Sigma = self.Sigma | r.Sigma
            return r_conc


class sdisj(sconnective):
    """Class that represents the disjunction operation for special regular expressions.

    .. inheritance-diagram:: sdisj
    """

    def __repr__(self):
        """
        :return: """
        return "sdisj({0:s})".format(repr(self.arg))

    def __str__(self):
        """
        :return: """
        return "({0:s})".format(self._strP())

    def _strP(self):
        """
        :return: """
        return " + ".join([str(i) for i in self.arg])

    def ewp(self):
        """
        :return: """
        for i in self.arg:
            if i.ewp():
                return True
        return False

    def _marked(self, pos):
        """
        :param pos:
        :return: """
        s = set()
        for i in self.arg:
            mark, pos = i._marked(pos)
            s.add(mark)
        return sdisj(s), pos

    def first(self):
        """
        :return: """
        fst = set()
        for ri in self.arg:
            fst.update(ri.first())
        return fst

    def last(self):
        """
        :return: """
        lst = set()
        for ri in self.arg:
            lst.update(ri.last())
        return lst

    def followLists(self, lists=None):
        """
        :param lists:
        :return: """
        if lists is None:
            lists = {}
        for ri in self.arg:
            ri.followLists(lists)
        return lists

    def followListsStar(self, lists=None):
        """
        :param lists:
        :return: """
        if lists is None:
            lists = {}
        s = set()
        for ri in self.arg:
            ri.followListsStar(lists)
            s.add(ri)
            # inspect
            self.cross(ri, s , lists)
        return lists

    def cross(self, ri, s, lists):
        """
        :return: """
        first_ri = ri.first()
        last_ri = ri.last()
        for rj in s:
            first_rj  = rj.first()
            for symbol in last_ri:
                if symbol in lists:
                    lists[symbol].update(first_rj)
                else:
                    lists[symbol] = first_rj
            last_rj = rj.last()
            for symbol in last_rj:
                if symbol in lists:
                    lists[symbol].update(first_ri)
                else:
                    lists[symbol] = first_ri
        return lists

    def derivative(self, sigma):
        """:param sigma:
         :return: """
        der = emptyset(self.Sigma)
        for alpha_i in self.arg:
            der = der._plus(alpha_i.derivative(sigma))
        return der

    def partialDerivatives(self, sigma):
        """
        :param sigma:
        :return: """
        pd = set()
        for i in self.arg:
            pd_re = i.partialDerivatives(sigma)
            pd.update(pd_re)
        return pd

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return: """
        pd = set()
        flag = True
        for re1 in self.arg:
            pd_re = re1.partialDerivativesC(sigma)
            if not pd_re:
                return pd_re
            elif flag:
                flag = False
                pd = pd_re
            else:
                pd = intersection_set(pd, pd_re)
        return pd

    def linearForm(self):
        """
        :return: """
        lf = {}
        for ri in self.arg:
            lf_re = ri.linearForm()
            lf = union_mon(lf, lf_re)
        return lf

    def linearFormC(self):
        """
        :return: """
        lf = {}
        flag = True
        for re1 in self.arg:
            if flag:
                flag = False
                lf = re1.linearFormC()
            else:
                lf_re = re1.linearFormC()
                lf = intersection_mon(lf, lf_re)
        return lf

    def support(self, side=True):
        """
        :return: """
        s = set()
        for i in self.arg:
            s.update(i.support(side))
        return s

    def _plus(self, re1):
        """
        :param re:
        :return: """
        if re1 == self:
            if self.Sigma and re1.Sigma:
                re1.Sigma = re1.Sigma | self.Sigma
            return re1
        elif type(re1) is emptyset or type(re1) is sigmaS:
            return re1._plus(self)
        if type(re1) is sdisj:
            r_disj = sdisj(self.arg | re1.arg)
            if self.Sigma and re1.Sigma:
                re1.Sigma = re1.Sigma | self.Sigma
            return r_disj
        else:
            r_disj = sdisj(self.arg | frozenset([re1]))
            if self.Sigma and re1.Sigma:
                r_disj.Sigma = re1.Sigma | self.Sigma
            return r_disj

class sconj(sconnective):
    """Class that represents the conjunction operation.

    .. inheritance-diagram:: concat
    """

    def __str__(self):
        """
        :return:"""
        return "({0:s})".format(self._strP())

    def _strP(self):
        """
        :return:"""
        return "&".join([str(i) for i in self.arg])

    def __repr__(self):
        """
        :return: """
        return "sconj({0:s})".format(repr(self.arg))

    def ewp(self):
        """
        :return: """
        for i in self.arg:
            if not i.ewp():
                return False
        return True

    def derivative(self, sigma):
        """:param sigma:
        :return: """
        der = sigmaS(self.Sigma)
        for alpha_i in self.arg:
            der = der._inter(alpha_i.derivative(sigma))
        return der

    def partialDerivatives(self, sigma):
        """
        :param sigma:
        :return: """
        pd = set()
        flag = True
        for i in self.arg:
            pd_re = i.partialDerivatives(sigma)
            if not pd_re:
                return pd_re
            elif flag:
                flag = False
                pd = pd_re
            else:
                pd = intersection_set(pd, pd_re)
        return pd

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return: """
        pd = set()
        for re1 in self.arg:
            pd_re = re1.partialDerivativesC(sigma)
            pd.update(pd_re)
        return pd

    def linearForm(self):
        """
        :return: """
        lf = {}
        flag = True
        for re1 in self.arg:
            if flag:
                flag =  False
                lf = re1.linearForm()
            else:
                lf_re = re1.linearForm()
                lf = intersection_mon(lf, lf_re)
        return lf

    def linearFormC(self):
        lf = {}
        for re1 in self.arg:
            lf_re = re1.linearFormC()
            lf = union_mon(lf, lf_re)
        return lf

    def support(self, side=True):
        """
        :return: """
        pi = set()
        flag = True
        for re1 in self.arg:
            pi_re = re1.support(side)
            if flag:
                flag = False
                pi = pi_re
            elif pi_re == set():
                return set()
            else:
                pi = intersection_set(pi, pi_re)
        return pi

    def _inter(self, re1):
        """
        :param re1:
        :return: """
        if re1 == self:
            if self.Sigma and re1.Sigma:
                re1.Sigma = re1.Sigma | self.Sigma
            return re1
        elif type(re1) is emptyset or type(re1) is sigmaS:
            return re1._inter(self)
        if type(re1) is sconj:
            r_conj = sconj(self.arg | re1.arg)
            if self.Sigma and re1.Sigma:
                re1.Sigma = re1.Sigma | self.Sigma
            return r_conj
        else:
            r_conj = sconj(self.arg | frozenset([re1]))
            if self.Sigma and re1.Sigma:
                r_conj.Sigma = re1.Sigma | self.Sigma
            return r_conj

class sstar(star):
    """Special regular expressions modulo associativity, commutativity, idempotence of disjunction and intersection;
      associativity of concatenation; identities Sigma^* and Sigma^+.

       sstar: Class that represents Kleene star

    .. seealso: sconnective

    .. inheritance-diagram::  sstar
    """

    def __init__(self, arg, sigma=None):
        super(sstar, self).__init__(arg, sigma)
        self.hash = None

    def __str__(self):
        """
        :return: """
        if type(self.arg) is sconcat or type(self.arg) is snot:
            return "({0:s})*".format(str(self.arg))
        else:
            return "{0:s}*".format(str(self.arg))

    def __repr__(self):
        """
        :return: """
        return "sstar({0:s})".format(repr(self.arg))

    def __hash__(self):
         if self.hash:
             return self.hash
         else:
             h = hash((self.arg, type(self)))
             self.hash = h
             return h

    def __eq__(self, other):
          return hash(self) == hash(other)

    def _setSigma(self, s):
        self.arg.setSigma(s)

    def derivative(self, sigma):
        """
        :param sigma:
        :return: """
        der = self.arg.derivative(sigma)
        return der._dot(self)

    def partialDerivatives(self, sigma):
        """
        :param sigma:
        :return:"""
        der = self.arg.partialDerivatives(sigma)
        return concat_set(der, self)

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return: """
        pd = self.arg.partialDerivatives(sigma)
        return negation_set(concat_set(pd, self), self.Sigma)

    def linearForm(self):
        """
        :return: """
        lf_arg = self.arg.linearForm()
        return concat_mon(lf_arg, self)

    def linearFormC(self):
        lf = self.linearForm()
        return negation_mon(lf, self.Sigma)

    def support(self, side=True):
        """
        :return: """
        p = self.arg.support(side)
        return concat_set(p, self)

class snot(regexp):
    """ Special regular expressions modulo associativity, commutativity, idempotence of disjunction and intersection;
        associativity of concatenation; identities Sigma^* and Sigma^+.
        snot: negation

    .. seealso: sconnective

    .. inheritance-diagram:: snot
    """

    def mark(self):
        pass

    def snf(self):
        pass

    def rpn(self):
        pass

    def _follow(self):
        pass

    def unmark(self):
        pass

    def followListsD(self):
        pass

    def first(self):
        pass

    def starHeight(self):
        pass

    def followLists(self):
        pass

    def reduced(self):
        pass

    def _marked(self):
        pass

    def last(self):
        pass

    def _memoLF(self):
        pass

    def __init__(self, arg, sigma=set()):
        super(snot, self).__init__()
        self.arg = arg
        self.Sigma = sigma
        self.hash = None

    def __hash__(self):
         if self.hash:
             return self.hash
         else:
             h = hash((self.arg, type(self)))
             self.hash = h
             return h

    def __eq__(self, other):
        return hash(self) == hash(other)

    def __str__(self):
        """
        :return: """
        if type(self.arg) is sconcat or type(self.arg) is sstar:
            return "{0:s}({1:s})".format(Not, self.arg._strP())
        else:
            return "{0:s}{1:s}".format(Not, self.arg._strP())

    _strP = __str__

    def __repr__(self):
        """
        :return:"""
        return "snot(%s)" % repr(self.arg)

    def _setSigma(self, s):
        self.arg.setSigma(s)

    def ewp(self):
        """
        :return:"""
        if self.arg.ewp():
            return False
        else:
            return True

    def alphabeticLength(self):
        """
        :return:"""
        return self.arg.alphabeticLength()

    def epsilonLength(self):
        """
        :return:"""
        return self.arg.epsilonLength()

    def syntacticLength(self):
        """
        :return:"""
        return 1 + self.arg.syntacticLength()

    def treeLength(self):
        """
        :return:"""
        return 1 + self.arg.treeLength()

    def setOfSymbols(self):
        """
        :return:"""
        return self.arg.setOfSymbols()

    def derivative(self, sigma):
        """
        :param sigma
        :return:"""
        der = self.arg.derivative(sigma)
        return snot(der, self.Sigma)

    def support(self, side=True):
        """
        :return:"""
        pi_arg = self.arg.support(side)
        power_pi = powerset(pi_arg)
        s = set(power_pi.next())
        pi = negation_set(s, self.Sigma)
        while s:
            s = set(power_pi.next())
            pi.update(negation_set(s, self.Sigma))
        return pi

    def partialDerivatives(self, sigma):
        """
        :param sigma:
        :return:"""
        return self.arg.partialDerivativesC(sigma)

    def partialDerivativesC(self, sigma):
        """
        :param sigma:
        :return:"""
        return self.arg.partialDerivatives(sigma)

    def linearForm(self):
        """
        :return: """
        return  self.arg.linearFormC()

    def linearFormC(self):
        """
        :return: """
        return self.arg.linearForm()


class ParseReg1(Yappy):
    """

    .. inheritance-diagram:: ParseReg1"""

    def __init__(self, no_table=0, table='.tablereg'):
        """ Parser for generic res """
        grammar = [("r", ["r", "|", "c1"], self.OrSemRule),
                   ("r", ["c1"], self.DefaultSemRule),
                   ("c1", ["c1", Conj, "c2"], self.ConjSemRule),
                   ("c1", ["c2"], self.DefaultSemRule),
                   ("c2", ["c2", Shuffle, "c"], self.ShuffleSemRule),
                   ("c2", ["c"], self.DefaultSemRule),
                   ("c", ["c", "s"], self.ConcatSemRule),
                   ("c", ["s"], self.DefaultSemRule),
                   ("s", ["s", "*"], self.StarSemRule),
                   ("s", ["o"], self.DefaultSemRule),
                   ("o", ["o", Option], self.OptionSemRule),
                   ("o", ["f1"], self.DefaultSemRule),
                   ("f1", [Not, "f"], self.NotSemRule),
                   ("f1", ["f"], self.DefaultSemRule),
                   ("f", ["b"], self.DefaultSemRule),
                   ("f", ["(", "r", ")"], self.ParSemRule),
                   ("b", ["id"], self.BaseSemRule),
                   ("b", [EmptySet], self.BaseSemRule),
                   ("b", [Epsilon], self.BaseSemRule),
                   ("b", [SigmaS], self.BaseSemRule),
                   ("b", [SigmaP], self.BaseSemRule)]
        tokenize = [("\s+", ""),
                    (Epsilon, lambda x: (x, x)),
                    (EmptySet, lambda x: (x, x)),
                    (SigmaS, lambda x: (x, x)),
                    (SigmaP, lambda x: (x, x)),
                    (Not, lambda x: (x, x)),
                    (Shuffle, lambda x: (x, x)),
                    (Conj, lambda x: (x, x)),
                    (Option, lambda x: (x, x)),
                    ("[A-Za-z0-9]", lambda x: ("id", x)),
                    ("\|", lambda x: (x, x)),
                    ("\+", lambda x: ("|", x)),
                    ("\*", lambda x: (x, x)),
                    ("\(|\)", lambda x: (x, x))]
        Yappy.__init__(self, tokenize, grammar, table, no_table)

    @staticmethod
    def DefaultSemRule(lst, _):
        return lst[0]

    @staticmethod
    def BaseSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        if lst[0] == Epsilon:
            return epsilon(sigma)
        if lst[0] == EmptySet:
            return emptyset(sigma)
        if lst[0] == SigmaS:
            return sigmaS(sigma)
        elif lst[0] == SigmaP:
            return sigmaP(sigma)
        return atom(lst[0], sigma)

    @staticmethod
    def ParSemRule(lst, _):
        """:param lst:
           :return:"""
        return lst[1]

    @staticmethod
    def OrSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return disj(lst[0], lst[2], sigma)

    @staticmethod
    def ConcatSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return concat(lst[0], lst[1], sigma)


    @staticmethod
    def ShuffleSemRule(lst, context=None):
        """
        :param lst:
        :param context:
        :return:"""
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return shuffle(lst[0], lst[2], sigma)


    @staticmethod
    def ConjSemRule(lst, context=None):
        """
        :param lst: argument list
        :param context:
        :return: regular expression
        :rtype: regexp"""
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return conj(lst[0], lst[2], sigma)

    @staticmethod
    def StarSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return star(lst[0], sigma)

    @staticmethod
    def OptionSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return option(lst[0], sigma)

    @staticmethod
    def NotSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return compl(lst[1], sigma)

    @staticmethod
    def DoPrint(lst, _):
        print(lst[0])
        return lst[0]


class ParseReg(ParseReg1):
    """

    .. inheritance-diagram:: ParseReg"""

    def __init__(self, no_table=1, table='.tableambreg'):
        """A parser for regular expressions with ambiguous rules: not working  """

        grammar = """reg -> reg + reg {{ self.OrSemRule }} |
         reg reg {{ self.ConcatSemRule }} // 200 left |
         reg * {{ self.StarSemRule }} |
         ( reg ) {{self.ParSemRule }} |
         id {{ self.BaseSemRule }};
    """

        tokenize = [(Epsilon, lambda x: ("id", x)),
                    (EmptySet, lambda x: ("id", x)),
                    (Option, lambda x: (x, x), ("?", 400, 'left')),
                    ("[A-Za-z0-9]", lambda x: ("id", x)),
                    ("[+|]", lambda x: ("+", x), ("+", 100, 'left')),
                    ("[*]", lambda x: (x, x), ("*", 300, 'left')),
                    ("\(|\)", lambda x: (x, x))]

        Yappy.__init__(self, tokenize, grammar, table, no_table)


class ParseReg2(ParseReg1):
    """

    .. inheritance-diagram:: ParseReg2"""

    def __init__(self, no_table=1, table='.tableambreg2'):
        grammar = """
    reg -> reg + reg {{ self.OrSemRule}}|
         reg reg {{ self.ConcatSemRule }} // 200 left  |
         reg * {{ self.StarSemRule }} |
         ( reg ) {{self.ParSemRule}} |
         id {{ self.BaseSemRule }} ;
    """
        tokenize = [("\s+", ""),
                    (Epsilon, lambda x: ("id", x), ("id", 400, 'left')),
                    (EmptySet, lambda x: ("id", x), ("id", 400, 'left')),
                    ("[A-Za-z0-9]", lambda x: ("id", x), ("id", 400, 'left')),
                    ("[+|]", lambda x: ("+", x), ("+", 100, 'left')),
                    ("[*]", lambda x: (x, x), ("*", 300, 'left')),
                    ("\(|\)", lambda x: (x, x))]

        Yappy.__init__(self, tokenize, grammar, table, no_table)


class ParserRPN(ParseReg1):
    def __init__(self, no_table=1, table='.tableshurpn'):
        grammar = [("reg", ["+", "reg", "reg"], self.OrSemRule),
                   ("reg", [Shuffle, "reg", "reg"], self.ShuffleSemRule),
                   ("reg", [Conj, "reg", "reg"], self.ConjSemRule),
                   ("reg", [".", "reg", "reg"], self.ConcatSemRule),
                   ("reg", ["*", "reg"], self.StarSemRule),
                   ("reg", [Not, "reg"], self.NotSemRule),
                   ("reg", [Option, "reg"], self.OptionSemRule),
                   ("reg", [Epsilon], self.BaseSemRule),
                   ("reg", [EmptySet], self.BaseSemRule),
                   ("reg", ["id"], self.BaseSemRule),
                   ("reg", [SigmaS], self.BaseSemRule),
                   ("reg", [SigmaP], self.BaseSemRule)]

        tokenize = [("\s+", ""),
                    (Epsilon, lambda x: (x, x)),
                    (EmptySet, lambda x: (x, x)),
                    (SigmaS, lambda x: (x, x)),
                    (SigmaP, lambda x: (x, x)),
                    (Not, lambda x: (x, x)),
                    (Shuffle, lambda x: (x, x)),
                    (Conj, lambda x: (x, x)),
                    (Option, lambda x: (x, x)),
                    ("[A-Za-z0-9]", lambda x: ("id", x)),
                    ("\|", lambda x: ("+", x)),
                    ("\.", lambda x: (".", x)),
                    ("\+", lambda x: (x, x)),
                    ("\*", lambda x: (x, x))]
        Yappy.__init__(self, tokenize, grammar, table, no_table)

    @staticmethod
    def OrSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return disj(lst[1], lst[2], sigma)

    @staticmethod
    def ConcatSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return concat(lst[1], lst[2], sigma)

    @staticmethod
    def StarSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return star(lst[1], sigma)

    @staticmethod
    def OptionSemRule(lst, context=None):
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return option(lst[1], sigma)

    @staticmethod
    def ShuffleSemRule(lst, context=None):
        """

        :param lst:
        :param context:
        :return:
        """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return shuffle(lst[1], lst[2], sigma)

    @staticmethod
    def ConjSemRule(lst, context=None):
        """
        :param lst:
        :param context:
        :return:
        """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return conj(lst[1], lst[2], sigma)


class ParseS(ParseReg1):
    """Parser for sre """

    def __init__(self, no_table=0, table='.tablesre'):
        super(ParseS,self).__init__(table=table)

    @staticmethod
    def OrSemRule(lst, context=None):
        """
        :param lst:
        :return: """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return lst[0]._plus(lst[2])

    @staticmethod
    def ConcatSemRule(lst, context=None):
        """
        :param lst:
        :return:"""
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return lst[0]._dot(lst[1])

    @staticmethod
    def ConjSemRule(lst, context=None):
        """
        :param lst:
        :return: """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return lst[0]._inter(lst[2])

    @staticmethod
    def StarSemRule(lst, context=None):
        """
        :param lst:
        :return: """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return sstar(lst[0],sigma)

    @staticmethod
    def NotSemRule(lst, context=None):
        """
        :param lst:
        :return: """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return snot(lst[1],sigma)

class ParseRPNS(ParseS):
    """Parser for sre in RPN """

    def __init__(self, no_table=0, table='.tablesrpn'):
        """
        :param no_table:
        :param table:
        :return:"""
        grammar = [("reg", ["|", "reg", "reg"], self.OrSemRule),
                   ("reg", [Conj, "reg", "reg"], self.ConjSemRule),
                   ("reg", [".", "reg", "reg"], self.ConcatSemRule),
                   ("reg", ["*", "reg"], self.StarSemRule),
                   ("reg", [Not, "reg"], self.NotSemRule),
                   ("reg", [Epsilon], self.BaseSemRule),
                   ("reg", [EmptySet], self.BaseSemRule),
                   ("reg", [SigmaS], self.BaseSemRule),
                   ("reg", [SigmaP], self.BaseSemRule),
                   ("reg", ["id"], self.BaseSemRule)]
        tokenize = [("\s+", ""),
                    (Epsilon, lambda x: (x, x)),
                    (EmptySet, lambda x: (x, x)),
                    (SigmaS, lambda x: (x, x)),
                    (SigmaP, lambda x: (x, x)),
                    (Conj, lambda x: (x, x)),
                    ("[A-Za-z0-9]", lambda x: ("id", x)),
                    ("\|", lambda x: (x, x)),
                    ("\+", lambda x: ("|", x)),
                    ("\*", lambda x: (x, x)),
                    ("\.", lambda x: (".", x)),
                    (Not, lambda x: (x, x))]
        Yappy.__init__(self, tokenize, grammar, table, no_table)

    @staticmethod
    def OrSemRule(lst, context=None):
        """
        :param lst:
        :return: """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return lst[1]._plus(lst[2])

    @staticmethod
    def ConcatSemRule(lst, context=None):
        """
        :param lst:
        :return:"""
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return lst[1]._dot(lst[2])

    @staticmethod
    def ConjSemRule(lst, context=None):
        """
        :param lst:
        :return: """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return lst[1]._inter(lst[2])

    @staticmethod
    def StarSemRule(lst, context=None):
        """
        :param lst:
        :return: """
        if "sigma" in context:
            sigma = context["sigma"]
        else:
            sigma = None
        return sstar(lst[1],sigma)

def to_s(r):
    """Reads sre from FAdo regexp.

    :arg regexp r: the FAdo representation regexp for a regular expression.
    :rtype: regexp"""
    if type(r) is atom or type(r) is epsilon or type(r) is emptyset:
        return r
    if type(r) is disj:
        return to_sdisj(r)
    if type(r) is concat:
        return to_sconcat(r)
    if type(r) is star:
        return to_sstar(r)

def to_sdisj(r):
    """
    :param r:
    :return:"""
    return sdisj(frozenset(_to_sdisj(r)))

def _to_sdisj(r):
    """
    :param r:
    :return: """
    if type(r.arg1) is disj:
        if type(r.arg2) is disj:
            return _to_sdisj(r.arg1) | _to_sdisj(r.arg2)
        else:
            return _to_sdisj(r.arg1) | {to_s(r.arg2)}
    else:
        if type(r.arg2) is disj:
            return {to_s(r.arg1)} | _to_sdisj(r.arg2)
        else:
            return {to_s(r.arg1)} | {to_s(r.arg2)}

def to_sconcat(r):
    """
    :param r:
    :return: """
    if type(r.arg1) is epsilon and type(r.arg2) is epsilon:
        return epsilon()
    elif type(r.arg1) is epsilon:
        return to_s(r.arg2)
    elif type(r.arg2) is epsilon:
        return to_s(r.arg1)
    else:
        return sconcat(_to_sconcat(r))


def _to_sconcat(r):
    """

    :return: """
    if type(r.arg1) is concat:
        if type(r.arg2) is concat:
            return _to_sconcat(r.arg1) + _to_sconcat(r.arg2)
        elif type(r.arg2) is epsilon:
            return _to_sconcat(r.arg1)
        else:
            return _to_sconcat(r.arg1) + (to_s(r.arg2),)
    else:
        if type(r.arg2) is concat:
            return (to_s(r.arg1),) + _to_sconcat(r.arg2)
        elif type(r.arg2) is epsilon:
            return to_s(r.arg1),
        else:
            return (to_s(r.arg1),) + (to_s(r.arg2),)


def to_sstar(re1):
    """
    :param re1:
    :return:"""
    r = to_s(re1.arg)
    if type(r) == epsilon:
        return r
    elif type(r) == sstar:
        return r
    else:
        return sstar(to_s(re1.arg))

def set2str(s):
    new_set = "{"
    for r in s:
        new_set += str(r) + ", "
    if new_set != "{":
        new_set = new_set[:-2] + "}"
    else:
        new_set += "}"
    return new_set

def setset2str(s):
    new_set = "{"
    for r in s:
        new_set += set2str(r) + ", "
    if new_set != "{":
        new_set = new_set[:-2] + "}"
    else:
        new_set += "}"
    return new_set

def dic2str(dic, label=None):
    res = "{"
    if not dic.keys():
        return res + "}"
    if label:
        for head in dic.keys():
            res += str(head) + ": " + dic2str(dic[head]) + ", "
    else:
        for head in dic.keys():
            s = dic[head]
            str_s = set2str(s)
            res += head + ": " + str_s + ", "
    return res[:-2] + "}"

def str2regexp(s, parser=ParseReg1, no_table=1, sigma=None, strict=False):
    """ Reads a regexp from string.

    :arg s:  the string representation of the regular expression
    :type s: string
    :arg parser: a parser generator for regexps
    :type parser: Yappy
    :arg no_table: if 0 table is created
    :type no_table: integer
    :arg sigma: alphabet of the regular expression
    :type sigma: list or set of symbols
    :arg strict: if True tests if the symbols of the regular expression are included in sigma
    :type strict: boolean
    :rtype: reex.regexp"""

    s = re.sub("\s+", "", s)
    d = parser(no_table)
    try:
        reg = d.input(s, context={"sigma": sigma})
    except LRParserError:
        raise regexpInvalid(s)
    if sigma is not None:
        reg.setSigma(sigma, strict)
 #   elif strict:
    else:
        reg.setSigma(reg.setOfSymbols())
    return reg

def str2sre(s, parser=ParseS,no_table=1, sigma = None, strict=False):
    """ Reads a sre from string. Arguments as str2regexp.

    :rtype: regexp"""
    return str2regexp(s, parser, no_table, sigma, strict)

def rpn2regexp(s, sigma=None, strict=False):
    """Reads a (simple) regexp from a RPN representation

    .. productionlist:: Representation R
       R: .RR | +RR | \*R | L | @
       L: [a-z] | [A-Z]

    :param s: RPN representation
    :type s: string
    :rtype: reex.regexp

    .. note:: This method uses python stack... thus depth limitations apply"""
    (nf, reg) = _rpn2re(re.sub("@epsilon", "@", s), 0, sigma)
    if sigma is not None:
        reg.setSigma(sigma, strict)
    elif strict:
        reg.setSigma(reg.setOfSymbols())
    return reg

def _rpn2re(s, i, sigma=None):
    """
    :param s:
    :param i:
    :return:
    """
    if s[i] in "+.":
        (i1, arg1) = _rpn2re(s, i + 1)
        (i2, arg2) = _rpn2re(s, i1)
        if s[i] == ".":
            return i2, concat(arg1, arg2, sigma)
        else:
            return i2, disj(arg1, arg2, sigma)
    if s[i] == "*":
        (i1, arg1) = _rpn2re(s, i + 1)
        return i1, star(arg1, sigma)
    if s[i] == "@":
        return i + 1, epsilon(sigma)
    else:
        return i + 1, atom(s[i], sigma)

def concat_set(s, re):
    """Computes a set that contains the concatenation of a regular expression with all the regular expression
        within a set.

        :arg s: set of regular expressions
        :arg r: regular expression
        :rtype: set of regular expression"""
    if type(re) is emptyset:
        return set()
    elif type(re) is epsilon:
        return s
    else:
        new_set = set()
        for re_i in s:
            new_set.add(re_i._dot(re))
        return new_set

def intersection_set(s1, s2):
    if s1 == set() or s2 == set():
        return set()
    else:
        new_set = set()
        for r1 in s1:
            for r2 in s2:
                new_set.add(r1._inter(r2))
        return new_set

def negation_set(s, Sigma = None):
    if s == set():
        return {sigmaS(Sigma)}
    else:
        re1 = sigmaS(Sigma)
        for re_i in s:
            if Sigma and re_i.Sigma:
                re1.Sigma = re1.Sigma | re_i.Sigma
            re1 = re1._inter(snot(re_i))
        re1.setSigma(Sigma)
        return {re1}

def concat_mon(d, re1):
    """Computes a set that contains the concatenation of a regular expression with all the monomials
        within a set.

        :arg s: set of monomials
        :arg r: regular expression
        :rtype: set of monomials"""
    if type(re1) is emptyset:
        return {}
    elif type(re1) is epsilon:
        return d
    else:
        new_dic = {}
        for sigma in d:
            new_set = set()
            for re_i in d[sigma]:
                new_set.add(re_i._dot(re1))
            new_dic[sigma] = new_set
        return new_dic

def intersection_mon(d1, d2):
    new_dic = {}
    for a in d1:
        if a in d2:
            new_dic[a] = intersection_set(d1[a], d2[a])
    return new_dic

def negation_mon(d, Sigma = None):
    new_dic = {}
    for a in Sigma:
        if a in d:
            new_dic[a] = negation_set(d[a], Sigma)
        else:
            new_dic[a] = negation_set(set(), Sigma)
    return new_dic

def union_mon(d1, d2):
    new_dic = {}
    keys = set(d1.keys()) | set(d2.keys())
    for a in keys:
        if a in d1 and a in d2:
            new_dic[a] = d1[a] | d2[a]
        elif a in d1:
            new_dic[a] = d1[a]
        elif a in d2:
            new_dic[a] = d2[a]
    return new_dic

def _odotshuffle(S, R, sigma=None):
    return {_dotshuffle(s1, s2, sigma) for s1 in S for s2 in R}

def _dotshuffle(s1, s2, sigma=None):
    if s1.epsilonP():
        a = s2
    elif s2.epsilonP():
        a = s1
    else:
        a = shuffle(s1, s2, sigma)
    return a

def _odotconj(S, R, sigma=None):
    return {conj(s1, s2, sigma) for s1 in S for s2 in R}

def powerset(iterable):
  """ Powerset of a set.

  :param iterable: the set
  :type iterable: list
  :returns: the powerset
  :rtype: itertools.chain"""

  s = list(iterable)
  return chain.from_iterable(combinations(s, (len(s))-r) for r in range(len(s)+1))


