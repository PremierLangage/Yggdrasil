title = Domaine de définition
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

n = randint(1, 10)
p = randint(1, 10)

f1 = ln(abs(x - p) - abs(x + n))
f2 = sqrt(x - n)/(x + p)
f3 = ln(x + p)/(x - n)

h = choice([f1, f2, f3])

if h == f1 :
    sol = [-oo, (p-n)/2[
elif h == f2 :
    sol = 1
else :
    sol = 1
==

question ==
Donner le domaine de définition de la fonction $! {{ h|latex }} !$ .
==

embed ==
==

prefix ==
==

latexsettings.order = 'ilex'

