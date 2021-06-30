extends = /model/math/expr.pl

before ==
from sympy import Limit

x = Symbol('x')

f, g = sample([exp(x), x**2, ln(x)], 2)
lim = Limit(f/g, x, oo)
sol = lim.doit()
==

question ==
Déterminer $! \displaystyle {{ lim|latex }}!$.
==

prefix ==
$! \displaystyle {{ lim|latex }}!$
==

keypad = ["+infty", "-infty"]