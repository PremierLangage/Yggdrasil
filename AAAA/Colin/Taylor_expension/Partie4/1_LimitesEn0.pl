# Auteur : Colin Petitjean
# Sujet : Application des DL : Limites en 0.
# Maj : 9/06/2022

title = Application des développements limités : Calcul de limite en 0.

extends = /model/math/expr.pl

before ==
from sympy import limit
var('x')

f = choice([2*x**2/(exp(x)-exp(-x)),
(ln(1+x)-x)/(x**2),
(ln(1+sin(x)))/(ln(1+x)),
(atan(x)+x-2*sin(x))/(x**5),
(2**x-1)/(ln(1+x)),
(cos(x) - sqrt(1-x**2))/(x**4),
(sqrt(1+x**2)-sqrt(1-x**2))/(x),
(exp(x**2)-cos(x))/(x**2),
(ln(1+x)-sin(x))/(x),
(x*sin(x))/(1-cos(x)),
(exp(x**2)-cos(x))/(x**2),
(sin(x)-x)/(x**3),
(1+ln(1+x)-exp(x))/(1-cos(x)),
(exp(sin(x))-exp(tan(x)))/(sin(x)-tan(x)),
(asin(x)-sin(x))/(x**3)
])

sol = limit(f, x, 0)
==

question ==
Déterminer la limite ci-dessous :
==


prefix ==
$! \lim\limits_{x \to 0} {{ f|latex }} = !$
==

solution ==
$! \lim\limits_{x \to 0} {{ f|latex }} =  {{ sol|latex }} !$
==
