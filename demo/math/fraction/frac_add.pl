extends = /model/math/expr.pl

title = Addition de fractions

before ==
from sympy import numer, denom

f = [(choice([1, 3, 5, 7]), 2),
(choice([1, 2, 4, 5, 7, 8]), 3),
(choice([1, 3, 5, 7]), 4),
(choice([1, 2, 3, 4, 6, 7, 8]), 5),
(choice([1, 5, 7]), 6)]

shuffle(f)

expr = r"\frac{ %d }{ %d } + \frac{ %d }{ %d }" % (f[0][0], f[0][1], f[1][0], f[1][1])
sol = Rational(*f[0]) + Rational(*f[1])
==

question ==
Calculer l'expression $! \displaystyle {{expr}} !$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==