extends = /model/math/interval.pl

before == 
from sympy import Interval, Min, Union
var('x')
a = randint(2,5)
b = randint(-2,3)
c = randint(-5,-1)

sol = Union(Interval(-oo, c),Interval(c,b),Interval(b,a))
==

question ==
Ecrire sous forme d'intervalle l'ensemble des réels $! \frac{(x-{{a}})(x-{{b}})}{(x-{{c}})} \geq 0 !$.
==

keypad = ["-infty", "+infty", "cup"]
