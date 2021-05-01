extends = /model/math/interval.pl

title = Inéquation produit


before ==
from sympy import solveset, S
var('x')
a, b = sample(range(-6, 6), k=2)
expr = (x + a) * (x + b)
ineq = choice([expr >= 0, expr > 0, expr <= 0,expr < 0])
sol = solveset(ineq, x, domain=S.Reals)
==

text ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==