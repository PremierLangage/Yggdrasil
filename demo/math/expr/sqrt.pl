extends = /model/math/expr.pl

before ==
p = randint(2, 5)
q = choice([2, 3, 5, 7])
sol = p**2*q
==

question ==
Ecrire l'expression suivante sous la forme  $% \sqrt{a} %$, où $% a %$ est un entier.
==

prefix ==
$! {{ p }} \sqrt{ {{ q }} } = !$
==

embed ==
\frac{1}{1+\sqrt{#}}
==
