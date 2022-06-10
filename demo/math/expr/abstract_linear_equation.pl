extends = /model/math/expr.pl

title = Exprimer une variable en fonction d'une autre

before ==
var('x y')
a = randint(-5, 5, [0])
b = randint(-5, 5, [0])
expr = a*y + b
sol = (x - b)/a
==

question ==
Soit deux nombres $! x !$ et $! y !$ tels que $! x = {{ expr|latex }}. !$ 
Exprimer $! y !$ en fonction $! x !$.
==

prefix ==
$! y = !$
==
