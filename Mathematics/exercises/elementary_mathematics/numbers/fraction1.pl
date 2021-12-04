extends = /model/math/expr.pl

before ==
a = randint(1, 3)
c = randint(2, 6)
b = randint(1, c-1)
f = a + Rational(b, c)
sol = 1
==

question ==
Ecrire l'expression suivante sous la forme .
==

prefix ==
$! \displaystyle {{ f|latex }} = !$
==

embed ==
# + \frac{ # }{1+\sqrt{#}}
==
