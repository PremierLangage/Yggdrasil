extends = /model/math/expr.pl

before ==
a = randint(1, 3)
c = randint(2, 6)
b = randint(1, c-1)
f1 = a*c+b
sol = 1
==

question ==
Ecrire la fraction suivante sous la forme d'un entier plus une fraction.
==

prefix ==
$! \displaystyle \frac{ {{f1}} }{ {{c}} }= !$
==

embed ==
# + \frac{ # }{ {{c}} }
==

evaluator ==
aa, bb = answers['math'].split(',')

if str(a) == aa and str(b) == bb:
    score = 100
    feedback = "Mauvaise réponse !"
else:
    score = 0
==

solution ==
$$ \frac{ {{f1}} }{ {{c}} } = {{a}} + \frac{ {{b}} }{ {{c}} } $$
==