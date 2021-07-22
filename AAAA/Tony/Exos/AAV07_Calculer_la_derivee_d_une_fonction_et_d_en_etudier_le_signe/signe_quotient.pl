extends = /model/math/interval.pl

before == 
from sympy import Interval, Min, Union
var('x')
a = randint(2,5)
b = randint(-2,3)
c = randint(-5,-1)
g = (x-a)*(x-b)/(x-c)

sol = Union(Interval(c,b),Interval(a,oo))
==

question ==
Ecrire sous forme d'intervalle l'ensemble des réels $! {{g|latex}} \geq 0 !$.
==

keypad = ["-infty", "+infty", "cup"]
