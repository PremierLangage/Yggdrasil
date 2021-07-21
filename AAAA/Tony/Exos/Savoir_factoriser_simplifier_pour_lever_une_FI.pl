
extends = /model/math/expr.pl

before ==
from sympy import Limit

x = Symbol('x')

a,b,c,d,e,f = randint(-5,5),randint(-5,5),randint(-5,5),randint(-5,5), randint(-5,5), randint(-5,5,[0])
f,g  = a*x**2 + b*x+c, d*x**2 + e*x+f

lim = choice([Limit(f/g, x, oo),Limit(f/g, x, -oo)])
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