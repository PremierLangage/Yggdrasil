extends = /model/math/expr.pl

before ==
from sympy import Sum

k, n = symbols('k n')

b = choice([n-1, n, n+1])
s = Sum(k, (k, 1, b))
from sympy import factor
sol = factor(s.doit())
==

question ==
Calculer la somme suivante.
==

prefix ==
$! \displaystyle {{ s|latex }} = !$
==
