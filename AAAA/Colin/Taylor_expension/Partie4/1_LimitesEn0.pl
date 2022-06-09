# Auteur : Colin Petitjean
# Sujet : Application des DL : Limites en 0.
# Maj : 9/06/2022

title = Application des développements limités : Calcul de limite en 0.

extends = /model/math/expr.pl

before ==
from sympy import limit
var('x')

f = 2*x**2/(exp(x)-exp(-x)) 

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
