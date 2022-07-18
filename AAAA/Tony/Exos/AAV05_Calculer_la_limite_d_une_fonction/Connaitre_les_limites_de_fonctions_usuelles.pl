extends = /model/math/expr.pl

before ==
from sympy import Limit

x = Symbol('x')
n = randint(1,5) 
a = choice([oo, -oo])
b = choice([oo,0])
lim = choice([Limit(exp(x), x, a), Limit(sin(x), x, a), Limit(x**n, x, a), Limit(cos(x), x, a), Limit(ln(x), x, b), Limit(sqrt(x), x, b),Limit(1/x, x, b)])
sol = lim.doit()
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer la limite suivante sachant que $!\infty!$ désigne $!+\infty!$.
==

prefix ==
$! \displaystyle {{ lim|latex }} = !$
==

keypad = ["+infty", "-infty","emptyset"]
