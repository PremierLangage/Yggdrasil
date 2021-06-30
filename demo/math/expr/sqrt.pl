extends = /model/math/expr.pl

before ==
p=randint(2,5)
q=choice([2,3,4,5,7,9])
sol=p**2*q
==

question ==
Ecrire l'expression suivante sous la forme  $% \sqrt{a} %$, où $% a %$ est un entier.
==

prefix ==
$! {{expr}} = !$
==

embed ==
\sqrt{\MathQuillMathField{}}
==

input_embed = \sqrt{\MathQuillMathField{}}
