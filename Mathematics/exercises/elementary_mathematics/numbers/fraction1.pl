extends = /model/math/expr.pl

before ==
a = randint(1, 3)
c = randint(2, 6)
b = randint(1, c-1)
f = a + Rational(b, c)
sol = 1
==

question ==
Ecrire la fraction suivante sous la forme d'un entier plus une fraction.
==

prefix ==
$! \displaystyle {{ f|latex }} = !$
==

embed ==
# + \frac{ # }{ {{c}} }
==
