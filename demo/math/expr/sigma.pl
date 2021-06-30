extends = /model/math/expr.pl

before ==
from sympy import Sum

k, n = symbols('k n')

b = choice([n-1, n, n+1])
lim = Sum(k, 1, b)
sol = sum.doit()
==

question ==
Calculer la somme suivante.
==

prefix ==
$! \displaystyle {{ sum|latex }} = !$
==
