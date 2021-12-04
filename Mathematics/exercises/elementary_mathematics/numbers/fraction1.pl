extends = /model/math/expr.pl

before ==
a = randint(1, 3)
c = randint(2, 6)
b = randint(1, c-1)
r = Rational(b, c)
f = a + r
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

evaluator ==
aa = answers['math'][0]
bb = answers['math'][1]
if str(a) == aa and str(b) == bb:
    score = 100
else:
    score = 0
feedback = str(answers['math'])
==

solution ==
$$ {{f|latex}} = {{a|latex}} + {{ r|latex }} $$
==