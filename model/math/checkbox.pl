extends = /model/basic/checkbox.pl

@ /model/math/jinja_math.py [jinja_env.py]
@ /model/math/json_math.py [json_encoder.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/components/mathinput/mathinput.py
@ /utils/components/mathinput/mathinput.html

before_scripts % ["mathimport", "importfunc", "before", "process"]
text =
form = 
latexsettings.ln_notation = True
latexsettings.inv_trig_style = full

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval
from sympy import integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==