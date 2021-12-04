extends = /model/math/expr.pl

before ==
a = randint(1, 3)
c = randint(2, 6)
b = randint(1, c-1)
f = a + Rational(b, c)
==

question ==
Ecrire l'expression suivante sous la forme  $% \sqrt{a} %$, où $% a %$ est un entier.
==

prefix ==
$! {{ f|latex }} = !$
==

embed ==
# + \frac{ # }{3}
==
