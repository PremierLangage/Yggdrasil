# Author: D. Doyen
# Tags: exponetial, equation
# Résoudre uen équation avec exponentielle
# Parameters:
# - nbsize: taille des nombres
# 19/7/2021

extends = /model/math/expr.pl

before ==
from sympy import solveset, S
var('x')
a = randint(-8,8,[0])
b= randint(-8,8,[0])
lhs = exp(a*x+b)
rhs = randint(1,8)
sol = list(solveset(lhs-rhs,x,domain=S.Reals))[0]
==

text ==
Déterminer la solution de l'équation $$ {{lhs|latex}} = {{rhs|latex}}.$$
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = feedback_message[error]
==

solution ==
La solution est $! {{ sol|latex }} !$.
==



