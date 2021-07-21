extends = /model/math/expr.pl

before ==
from sympy import Limit

x = Symbol('x')

a,b,c,d,e,f = randint(-5,5),randint(-5,5,[0]),randint(-5,5),randint(-5,5), randint(-5,5,[0]), randint(-5,5) 
n = randint(1,5)
f = choice([exp(x),exp(-x), x**n, sin(x),cos(x), ln(x)]) 

a = choice([oo, -oo])
lim = choice([Limit(exp(x), x, a)])
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
