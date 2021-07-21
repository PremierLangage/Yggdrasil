
extends = /model/math/expr.pl

title = Savoir calculer une limite savoir factoriser/simplifier pour lever une FI

before ==
from sympy import Limit

x = Symbol('x')

a,b,c,d,e,f = randint(-5,5),randint(-5,5,[0]),randint(-5,5),randint(-5,5), randint(-5,5,[0]), randint(-5,5)
d1,d2 = sample([1,2,3,4,5],2)
f,g  = a*x**d1 + b*x+c, d*x**d2 + e*x+f

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