title = Conditions de continuité
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

h = f1
# choice([f1, f2, f3])

if h == f1 :
    sol = Interval(-oo, (p-n)/2, False, False)
if h == f2 :
    sol = 1
if h == f3 : 
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


