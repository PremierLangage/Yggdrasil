extends = /model/math/expr.pl

before ==
from sympy import O, series
var('x')
dlf = 1 -x + x**2 + O(x**3)
sol = diff(dlf, x)
==

question ==
On a $! f(x) = {{ dlf|latex }} !$ (autour de $! 0 !$).
En déduire le développement limité de de $! f' !$ (autour de $! 0 !$).
==

prefix ==
$! f'(x) = !$
==

solution ==
$! {{ sol|latex }} !$
==