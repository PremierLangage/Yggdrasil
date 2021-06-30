extends = /model/math/expr.pl

before ==
from sympy import Limit

x = Symbol('x')

f, g = sample([2*x+1, x+2, 2*x**2+1, x**2+1], 2)
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