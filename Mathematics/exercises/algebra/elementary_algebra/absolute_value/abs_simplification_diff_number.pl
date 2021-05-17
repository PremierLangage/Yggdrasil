extends = /model/basic/checkbox.pl

title = Simplification de valeurs abolues

importfunc ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import var, symbols, Symbol
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==

@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py

before ==
lst = [choice([2*pi,pi]),choice([2*sqrt(2),sqrt(2)]),choice([sqrt(3),2*sqrt(3)])]
shuffle(lst)
indsol = sampleint(0, 3, randint(1, 2))
items = []
for i in range(len(lst)):
    a=lst[i]
    b=choice([randint(1,floor(a)),randint(ceiling(a),ceiling(a)+2)])
    a,b = sample([a,b], 2)
    a_tex = latex(a)
    b_tex = latex(b)
    if a>b:
        simptrue = '%s - % s' % (a_tex,b_tex)
        simpfalse = '%s - % s' % (b_tex,a_tex)
    else:
        simptrue = '%s - % s' % (b_tex,a_tex)
        simpfalse = '%s - % s' % (a_tex,b_tex)
    if i in indsol:
        simpexpr=simptrue
        indsol.append(i)
    else:
        simpexpr=simpfalse
    s='$$ |%s - % s| = %s $$' % (a_tex,b_tex,simpexpr)
    items.append(s)
    
==

text ==
Sélectionner les simplifications qui sont exactes dans la liste ci-dessous.
==


