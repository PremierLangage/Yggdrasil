extends = /model/math/interval.pl

before == 
from sympy import Interval, Min, Union
var('x')
a = randint(2,5)
b = randint(-2,3)
c = randint(-5,-1)
g = choice([(x-a)*(x-b)/(x-c),(x-a)/(x-b), (x-b)*(x-c)/(x**2+a)])

if g == (x-a)*(x-b)/(x-c):
    sol = Union(Interval(c,b,left_open=True),Interval(a,oo))
elif g == (x-a)/(x-b):
    sol = Union(Interval(c,b,left_open=True),Interval(a,oo))
else : 
    sol = Union(Interval(c,b,left_open=True),Interval(a,oo))

==

question ==
Ecrire sous forme d'intervalle l'ensemble des réels $! {{g|latex}} \geq 0 !$. Attention une borne ouverte s'écrira avec une parenthèse et une bonne fermée avec un crochet fermé.
==

keypad = ["-infty", "+infty", "cup"]
