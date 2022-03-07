# Author: D. Doyen
# Tags: logarithm, exponential equation
# Résoudre une équation avec logarithme
# 19/7/2021

extends = /model/math/expr.pl

before ==
from sympy import solveset, S
x = Symbol('x')
a = randint(-8, 8, [0])
b = randint(-8, 8, [0])
lhs = ln(a*x + b)
rhs = randint(-8,8,[0])
sol = list(solveset(lhs-rhs, x, domain=S.Reals))[0]
==

question ==
Déterminer la solution de l'équation $$ {{lhs|latex}} = {{rhs|latex}}.$$
==