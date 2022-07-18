extends = /model/basic/dropgroup.pl

before_scripts = ["mathimport", "initinput", "before", "process"]

latexsettings.ln_notation = True
latexsettings.inv_trig_style = full

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, factor, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval
from sympy import integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==

tplpage =@ /model/tplpage/basicmath.html
