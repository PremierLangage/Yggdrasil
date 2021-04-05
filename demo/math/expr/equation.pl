extends = /model/math/expr.pl

title = Calculer la distance entre deux points du plan

before ==
var('x y')
a = randint(-5, 5, [0])
b = randint(-5, 5, [0])
expr = a*y+b
sol = (x-b)/a
==

text ==
Soit deux nombres $! x !$ et $! y !$ tels que :
$$ x = {{ expr|latex }}.$$

Exprimer $! y !$ en fonction $! x !$.
==

input_prefix = $! y = !$
