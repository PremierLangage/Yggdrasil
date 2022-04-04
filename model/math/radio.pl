extends = /model/basic/radio.pl

before_scripts = ["mathimport", "initinput", "before", "process"]

latexsettings.ln_notation = True
latexsettings.inv_trig_style = full

mathimport == #|py|
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln, atan, acos, asin
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, factor, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval, Matrix
from sympy import Sum, Limit
from sympy import diff, integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import CustomLatexPrinter
latex = CustomLatexPrinter(latexsettings).doprint
from latex2sympy import latex2sympy
from randsympy import randpoly
from randsympy import randmat, randmat_invertible, randmat_fullrank, randmat_givenrank
==

tplpage =@ /model/tplpage/basicmath.html
