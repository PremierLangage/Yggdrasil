extends = /model/math/input.pl

title = Symbole Sigma

before ==
from sympy import Sum
v=choice([Symbol('i'),Symbol('k')])
a=randint(*eval(param['range_init']))
b=a+randint(*eval(param['range_length']))
expr=choice(eval(param['expr']))
S = Sum(expr, (v, a, b))
sol = S.doit()
==

question ==
Calculer $! \displaystyle {{S|latex}} !$.
==


solution ==
La solution est $! {{sol|latex}} !$.
==





