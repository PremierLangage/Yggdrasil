extends = /model/math/expr.pl

title = Déterminer une solution particulière

before ==
from sympy import Function
var('t')
y = symbols('y', cls=Function)
a = randint(-3, 3, [0])
b = randint(-3, 3, [0])
expr = y(t).diff(t) + a*y(t) + b

==

question ==
Déterminer une solution particulière $! {{ expr|latex }} = 0 !$.
==


prefix ==
$! y'(t) = !$
==
