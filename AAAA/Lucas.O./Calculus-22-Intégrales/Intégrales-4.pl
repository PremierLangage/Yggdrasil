title = Décomposition en éléments simples
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
from sympy import Integral
var('x')

a = randint(1, 5)
b = randint(a+1, 10)

c = randint(1, 6)
d = randint(1, 4)

h = choice([Integral(c/((x+1)*(x+2)), (x, a, b)),
    Integral(, (x, a, b)), 
    Integral(, (x, a, b))])

if h == Integral(c/((x+1)*(x+2)), (x, a, b)) :
    y = 
if h == Integral((cos(x))**3, (x, a, b)) :
    y = sin(x)
if h == Integral(sqrt(x)/(x+1)**2, (x, a, b)) :
    y = sqrt(x)

sol = h.doit()
==

question ==
Calculer l'intégrale suivante, en mettant sous la forme $!  !$
==

embed ==
==

prefix ==
$! {{ h|latex }} = !$
==

latexsettings.order = 'ilex'

