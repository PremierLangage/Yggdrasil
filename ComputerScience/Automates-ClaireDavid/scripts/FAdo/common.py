# -*- coding: utf-8 -*-
"""**Common definitions for FAdo files**

.. *Authors:* Rogério Reis & Nelma Moreira

.. *This is part of FAdo project*   http://fado.dcc.fc.up.pt.

.. *Copyright:* 1999-2014 Rogério Reis & Nelma Moreira {rvr,nam}@dcc.fc.up.pt

.. *Contributions by:*
   - Marco Almeida
   - Hugo Gouveia

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

from __future__ import print_function

import os
import random
from copy import deepcopy
from abc import abstractmethod
import functools
import tempfile
import subprocess
import warnings
import re
from itertools import chain, combinations
try:
    from IPython.display import display, SVG, get_ipython
except:
    pass

FAdoVersion = "1.3.5.1"

def run_from_ipython_notebook():
    try:
        __IPYTHON__
        cfg = get_ipython().config
        if 'IPKernelApp' in cfg:
            return True
        else:
            return False
    except NameError:
        return False

MAXLBL = 10


class fnhException(Exception):
    pass


class NImplemented(fnhException):
    pass


class NonPlanar(fnhException):
    pass


class VertexNotInGraph(fnhException):
    pass


class FAException(fnhException):
    pass


class DFAerror(fnhException):
    pass


class TFASignal(fnhException):
    pass


class PDAerror(fnhException):
    pass


class CFGerror(fnhException):
    pass


class FAdoError(Exception):
    pass


class FAdoGeneralError(FAdoError):
    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return "FAdo: " + self.msg


class VersoError(FAdoGeneralError):
    pass


class TFAAccept(TFASignal):
    pass


class TFAReject(TFASignal):
    pass


class TFARejectLoop(TFAReject):
    pass


class TFARejectBlocked(TFAReject):
    pass


class TFARejectNonFinal(TFAReject):
    pass


class CFGgrammarError(CFGerror):
    def __init__(self, rule):
        self.rule = rule

    def __str__(self):
        return "Error in rule %s" % self.rule


class CFGterminalError(CFGerror):
    def __init__(self, size):
        self.size = size

    def __str__(self):
        return "To many alphabetic symbols: %s" % self.size


class DFAnoInitial(DFAerror):
    def __str__(self):
        return "No initial state defined"


class DuplicateName(DFAerror):
    def __init__(self, number):
        self.number = number

    def __str__(self):
        return "State  number %s repeated" % self.number


class FAdoSyntacticError(FAdoError):
    pass


class DFASyntaticError(DFAerror):
    def __init__(self, line):
        self.line = line


class DFAstateUnknown(DFAerror):
    def __init__(self, stidx):
        self.stidx = stidx

    def __str__(self):
        return "State  %s unknown" % self.stidx


class DFAnotNFA(DFAerror):
    def __init__(self, msg):
        self.message = msg

    def __str__(self):
        return "Not a DFA %s" % self.message


class DFAepsilonRedefinition(DFAerror):
    pass


class DFAsymbolUnknown(DFAerror):
    def __init__(self, sym):
        self.symbol = sym

    def __str__(self):
        return "Symbol %s is unknown" % self.symbol


class DFAstopped(DFAerror):
    pass


class DFAFileError(DFAerror):
    def __init(self, name):
        self.filename = name

    def __str__(self):
        return "Error in file: %s" % self.filename


class DFAFound(DFAerror):
    def __init__(self, word):
        self.word = word[:]

    def __str__(self):
        return "Found: $s" % self.word


class DFAEmptyDFA(DFAerror):
    def __str__(self):
        return "Dfa is empty"


class DFAequivalent(DFAerror):
    def __str__(self):
        return "Dfa are equivalent"


class DFAnotComplete(DFAerror):
    def __str__(self):
        return "Dfa is not complete"


class DFAnotMinimal(DFAerror):
    def __str__(self):
        return "Dfa is not minimal"


class DFAinputError(DFAerror):
    def __init__(self, word):
        self.word = word

    def __str__(self):
        return "Input error: %s" % self.word


class DFAdifferentSigma(DFAerror):
    def __str__(self):
        return "Dfas with different alphabets"


class DFAEmptySigma(DFAerror):
    def __str__(self):
        return "Dfa alphabet is empty"


class DFAmarkedError(DFAerror):
    def __init__(self, sym):
        self.sym = sym

    def __str__(self):
        return "Symbol not marked %s" % str(self.sym)


class TRError(FAException):
    def __str__(self):
        return "Transducer Error"




class regexpInvalid(DFAerror):
    def __init__(self, word):
        self.word = word
        self.message = 'Error in regexp %s' % word

    def __str__(self):
        return "%s" % self.message


class regexpInvalidSymbols(DFAerror):
    def __init__(self):
        self.message = 'Symbols in regexp do not match alphabet'

    def __str__(self):
        return "%s" % self.message

class regexpInvalidMethod(FAdoGeneralError):
    def __init__(self):
        self.message = 'Method not Immplemented for %s' %str(type(self))

    def __str__(self):
        return "%s" % self.message

class PEGError(FAdoGeneralError):
    pass


class notAcyclic(DFAerror):
    def __str__(self):
        return "Automaton is not acyclic "


class IllegalBias(FAdoGeneralError):
    def __str__(self):
        return "Bias with illegal value "


class CodesError(FAdoGeneralError):
    pass


class CodingTheoryError(Exception):
    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return "FAdo: coding theory error. Message: " + self.msg


class PropertyNotSatisfied(CodesError):
    def __str__(self):
        return "Property not satisfied"


class GraphError(fnhException):
    def __init__(self, message):
        self.message = message

    def __str__(self):
        return "%s" % self.message


class TestsError(DFAerror):
    def __init__(self, message):
        self.message = message

    def __str__(self):
        return "%s" % self.message


class PDAsymbolUnknown(PDAerror):
    def __init__(self, symb):
        self.symb = symb

    def __str__(self):
        return "Unknown stack symbol %s" % self.symb


class NotSP(DFAerror):
    def __str__(self):
        return "DFA is not Serial-Paralel."

"""
:var EmptySet: default representation for empty set
:var Epsilon: default representation for epsilon
:var Dot: default representation for "au point" dot
:var DeadName: default name given to dead states
"""
EmptySet = "@empty_set"
Epsilon = "@epsilon"
Dot = "@dot"
DeadName = "DeaD"
Option = "-"
Shuffle = ":"
Conj = "&"
Not = "~"
SigmaP = "@sigmaP"
SigmaS = "@sigmaS"

DEBUG = False

TYPE_DISJ = "disj"
TYPE_CONC = "concat"
TYPE_STAR = "star"
TYPE_SYMB = "sym"
TYPE_EWRD = "ewrd"
TYPE_ESET = "eset"
TYPE_CONJ = "conj"
TYPE_SHUFFLE = "shuffle"


def if_else(a, b, c):
    if a:
        return b
    return c


def debug(string, level=0):
    print("%s%s" % ("".join(["\t" for _ in xrange(level)]), string))



class SPLabel(object):
    """Label class for Serial-Paralel test algorithm

    .. seealso::
        Moreira & Reis, Fundamenta Informatica, 'Series-Paralel automata and short regular expressions',  n.91 3-4,
        pag 611-629"""

    def __init__(self, val=None):
        if not val:
            val = []
        self.value = val

    def __repr__(self):
        if type(self.value) is type(lbl()):
            return 'spl: ref %s' % self.lastref()
        else:
            return 'spl: val %s' % str(self.value)

    def val(self):
        if type(self.value) is type(lbl()):
            return self.value.val()
        else:
            return self.value

    def ref(self):
        return lbl(self)

    def assign(self, val):
        self.lastref().value = val

    def lastref(self):
        if type(self.value) is type(lbl()):
            return self.value.lastref()
        else:
            return self

    def copy(self):
        return lbl(deepcopy(self.val()))


class lbl(object):
    def __init__(self, val=None):
        if not val:
            val = []
        self.value = val

    def __repr__(self):
        if type(self.value) is type(lbl()):
            return 'lbl: ref %s' % self.lastref()
        else:
            return 'lbl: val %s' % str(self.value)

    def val(self):
        if type(self.value) is type(lbl()):
            return self.value.val()
        else:
            return self.value

    def ref(self):
        return lbl(self)

    def assign(self, val):
        self.lastref().value = val

    def lastref(self):
        if type(self.value) is type(lbl()):
            return self.value.lastref()
        else:
            return self

    def copy(self):
        return lbl(deepcopy(self.val()))


class memoized(object):
    """Decorator that caches a function's return value each time it is called.

    If called later with the same arguments, the cached value is returned, and not re-evaluated."""
    def __init__(self, func):
        self.func = func
        self.cache = {}

    def __call__(self, *args):
        try:
            return self.cache[args]
        except KeyError:
            value = self.func(*args)
            self.cache[args] = value
            return value
        except TypeError:
            # uncachable -- for instance, passing a list as an argument.
            # Better to not cache than to blow up entirely.
            return self.func(*args)

    def __repr__(self):
        """Return the function's docstring."""
        return self.func.__doc__

    # noinspection PyUnusedLocal
    def __get__(self, obj, objtype):
        """Support instance methods."""
        return functools.partial(self.__call__, obj)


def memoize(cls, method_name):
    """Memoizes a given method result on instances of given class.

    Given method should have no side effects. Results are stored as instance attributes --- given parameters are
    disregarded.

    :param cls:
    :param method_name:

    .. note: original method is stored as <cls>.memoize_<method_name>_original

    .. note: values are stored as <instance>.memoized_<method_name>

    .. attention: all instances in all threads will be affected"""
    saved_name = "memoize_" + method_name + "_original"
    if hasattr(cls, saved_name):
        return False
    attr_name = "memoized_" + method_name
    method = getattr(cls, method_name)
    setattr(cls, saved_name, method)
    if not hasattr(cls, "memoized_instances"):
        cls.memoized_instances = {}
    inst_list = []
    cls.memoized_instances[method_name] = inst_list

    def memo(self, *param):
        try:
            return getattr(self, attr_name)
        except AttributeError:
            value = method(self, *param)
            setattr(self, attr_name, value)
            inst_list.append(self)
            return value

    memo.__name__ = method_name
    setattr(cls, method_name, memo)
    return True


def dememoize(cls, method_name):
    """Restore method of given class from memoized state. Stored attributes will be removed."""
    saved_name = "memoize_" + method_name + "_original"
    if not hasattr(cls, saved_name):
        return False
    method = getattr(cls, saved_name)
    delattr(cls, saved_name)
    setattr(cls, method_name, method)
    for instance in cls.memoized_instances[method_name]:
        delattr(instance, "memoized_" + method_name)
    del cls.memoized_instances[method_name]
    if not cls.memoized_instances:
        del cls.memoized_instances
    return True

try:
    from itertools import product as cartesianProduct
except ImportError:
    def cartesianProduct(x, y):
        return [(a, b) for a in x for b in y]


def uSet(s):
    """returns the first element of a set

    :param set s: the set
    :return: the first element of s"""
    return list(s)[0]

def lSet(s):
    """returns the last element of a set

    :param set s: the set
    :return: the last element of the set

    .. versionadded:: 1.3.3"""
    return list(s)[-1]

def tmpFileName():
    i = os.getpid()
    r = random.randint(0, 1000000)
    return "/var/tmp/F%d-%d" % (i, r)


def forceIterable(x):
    """Forces a non iterable object into a list, otherwise returns itself

    :param list x: the object
    :return: object as a list
    :rtype: list"""
    if not getattr(x, '__iter__', False):
        return list([x])
    else:
        return x


def binomial(n, k):
    """ Exactly what it seems

    :param int n: n
    :param int k: k
    :rtype: int"""
    return reduce(lambda acc, m: acc * (n - k + m) / m, range(1, k + 1), 1)


def delFromList(l, l1):
    """Delete every element of l1 from l

    :type l: list
    :type l1:list

    .. versionadded: 0.9.8"""
    for i in l1:
        l.remove(i)


def suffixes(word):
    """Returns the list of proper suffixes of a word

    :param word: the word
    :type word: str
    :rtype: list

    .. versionadded: 0.9.8"""
    return [word[i:] for i in range(1, len(word))]

def overlapFreeP(word):
    """
    Returns True if word is overlap free, i.e, no  proper  and nonempty
     prefix  is a suffix

    :param word: the word
    :rtype: Boolean
    """
    l = len(word)
    for i in range(l-1):
        foo = True
        for j in range(i+1):
            if word[j] != word[-(i+1)+j]:
                foo = False
                break
        if foo:
            return False
    return True

def graphvizTranslate(s, strict=False, maxLblSz=6):
    """Translate epsilons for graphviz

    :param str s: symbol
    :arg maxLblSz: max size of labels before getting removed
    :param bool strict: use limitations of label sizes
    :rtype: str"""
    return re.sub(Epsilon,"&epsilon;",s)


def powerset_generator(i):
    for subset in chain.from_iterable(combinations(i, r) for r in range(len(i) + 1)):
        yield set(subset)


def deprecated(func):
    """This is a decorator which can be used to mark functions as deprecated. It will result in a warning being emmitted
    when the function is used."""
    def newFunc(*args, **kwargs):
        warnings.warn("Call to deprecated function %s." % func.__name__, category=DeprecationWarning)
        return func(*args, **kwargs)
    newFunc.__name__ = func.__name__
    newFunc.__doc__ = func.__doc__
    newFunc.__dict__.update(func.__dict__)
    return newFunc


class Drawable(object):
    """Any FAdo object that is drawable"""
    def display(self, fileName=None, size="30,20", strict=False, maxLblSz=6):
        """ Display automata using dot

        :arg size: size of representation
        :arg fileName: filename to use for the graphic representation (default a os tmpfile
        :arg int maxLblSz: max size of labels before getting removed
        :arg bool strict: use limitations of label sizes

        .. versionchanged:: 1.2.1"""
        if fileName is not None:
            fnameGV = fileName + ".gv"
            if run_from_ipython_notebook():
                filenameOut = fileName + ".svg"
            else:
                filenameOut = fileName + ".pdf"
        else:
            f = tempfile.NamedTemporaryFile(suffix=".gv")
            f.close()
            fnameGV = f.name
            fname, _ = os.path.splitext(fnameGV)
            if run_from_ipython_notebook():
                filenameOut = fname + ".svg"
            else:
                filenameOut = fname + ".pdf"
        foo = open(fnameGV, "w")
        foo.write(self.dotFormat(size, strict=strict, maxLblSz=maxLblSz))
        foo.close()
        if run_from_ipython_notebook():
            callstr = "dot -Tsvg %s -o %s" % (fnameGV, filenameOut)
        else:
            callstr = "dot -Tpdf %s -o %s" % (fnameGV, filenameOut)
        result = subprocess.call(callstr, shell=True)
        if result:
            print("Need graphviz to visualize objects")
            return
        if run_from_ipython_notebook():
            display(SVG(filename=filenameOut))
        elif os.name == 'nt':
            os.system("start %s" % filenameOut)
        else:
            os.system("open %s" % filenameOut)

    def makePNG(self, fileName=None, size="30,20"):
        """ Produce png file to display

        :param str fileName: file name, if None will be a tmpfile
        :param size: size for graphviz
        :return: name of the file created

        .. versionadded:: 1.0.4"""
        if fileName is not None:
            fnameGV = fileName + ".gv"
            fnamePNG = fileName + ".png"
        else:
            f = tempfile.NamedTemporaryFile(suffix=".gv")
            f.close()
            fnameGV = f.name
            fname, _ = os.path.splitext(fnameGV)
            fnamePNG = fname + ".png"
        foo = open(fnameGV, "w")
        foo.write(self.dotFormat(size))
        foo.close()
        callstr = "dot -Tpng %s -o %s" % (fnameGV, fnamePNG)
        result = subprocess.call(callstr, shell=True)
        if result:
            print("Need graphviz to visualize objects")
            return
        return fnamePNG

    @abstractmethod
    def dotFormat(self, size):
        """Some dot representation

        :param str size: size parameter for dotviz
        :rtype: str"""
        pass


class Word(object):
    """Class to implement generic words as iterables with pretty-print

    Basically a unified way to deal with words with caracters of of sizes different of one with no much fuss"""
    def __init__(self, data=None, it=None):
        if it is not None:
            for c in it:
                self.append(c)
        self.Sigma = set()
        self.Epsilon = False
        self.simple = True
        if data is None or data == Epsilon:
            self.data = []
            self.Epsilon = True
        else:
            self.data = []
            for c in data:
                self.data.append(c)

    def __str__(self):
        if self.Epsilon:
            return Epsilon
        else:
            f = "'"
            for i in self.data:
                f += str(i)
            f += "'"
            return f

    def __hash__(self):
        return hash(repr(self))

    def __repr__(self):
        return "Word:%s" % self.__str__()

    def __len__(self):
        return len(self.data)

    def __contains__(self, item):
        return item in self.data

    def __getitem__(self, item):
        return self.data[item]

    def __eq__(self, other):
        if self.Epsilon & other.Epsilon:
            return True
        else:
            return self.data == other.data

    def __cmp__(self, other):
        a, b = len(self.data), len(other.data)
        if a == b:
            return cmp(self.data, other.data)
            # if self.data < other.data:
            #     return -1
            # elif self.data > other.data:
            #     return 1
            # else:
            #     return 0
        elif a < b:
            if self.data < other.data[:a+1]:
                return -1
            elif self.data > other.data[:a+1]:
                return 1
            else:
                return -1
        else:
            if self.data[:b+1] < other.data:
                return -1
            elif self.data[:b+1] > other.data:
                return 1
            else:
                return 1

    # def __add__(self, other):
    #     new = deepcopy(self)
    #     for c in other:
    #         new.append(c)
    #     return new

    def append(self, value):
        if len(value) != 1:
            self.simple = False
        if value != '':
            self.Epsilon = False
            self.Sigma.add(value)
            self.data.append(value)

    def dup(self):
        return deepcopy(self)

    def __add__(self, other):
        if not isinstance(other, Word):
            raise FAdoSyntacticError()
        else:
            new = self.dup()
            for c in other:
                new.append(c)
            return new

    def epsilonP(self):
        return self.Epsilon


class AllWords:
    """ Iterator thar generates all words of an alphabet in militar order """
    def __init__(self, alphabet):
        """
        :type alphabet: list|set"""
        self.last = None
        if type(alphabet) is set:
            alphabet = sorted(list(alphabet))
        self.alphabet = alphabet
        self.cmax = len(alphabet) - 1
        self.wl = 0

    def __iter__(self):
        return self

    def _translate(self):
        if not self.last:
            return Epsilon
        else:
            return [self.alphabet[i] for i in self.last]

    def _next(self, w, l, k):
        if w is None:
            return []
        elif not w:
            return self._first(w, 1, 0)
        else:
            i = w[k]
            if i < self.cmax:
                return self._first(w[:k] + [i + 1], l, k + 1)
            elif k == 0:
                return self._first(w, l + 1, 0)
            else:
                return self._next(w, l, k - 1)

    def _first(self, w, l, k):
        if k == 0:
            self.wl = l
            return [0 for _ in range(l)]
        else:
            return w[:k] + [0 for _ in range(l - k)]

    def next(self):
        self.last = self._next(self.last, self.wl, self.wl - 1)
        return Word(self._translate())


def unique(l):
    """ Eliminate duplicates

    :param list l: source list
    :return: list wthout repetitions
    :rtype: lst"""
    foo = []
    for i in l:
        if i not in foo:
            foo.append(i)
    return foo


def homogeneousP(l):
    """ Is the list homogeneous?

    :param list l: list to be inspected
    :rtype: bool"""
    if not l:
        return True
    f = l[0]
    for i in l[1:]:
        if i != f:
            return False
    return True


class twDict(object):
    """A class for dictionaries 'both ways' """
    def __init__(self, fw={}):
        self.fw, self.bw  = dict(), dict()
        for k in fw:
            foo = fw[k]
            self.fw[k] = foo
            self.bw[foo] = self.bw.get(foo, set()).add(k)
            self.mult[foo] = self.mult.get(foo,0) + 1


    def set(self, k, val):
        if k in self.fw:
            foo = self.fw[k]
        self.fw[k] =val
        self.bw[val] = self.bw.get(val, set()).add(k)
        if len(self.bw[foo]) == 1:
            del(self.bw[foo])
        else:
            self.bw[foo].discard(k)

    def get(self, k):
        return self.fw[k]

    def getB(self, v):
        return self.bw[v]
