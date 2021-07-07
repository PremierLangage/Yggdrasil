extends = /model/math/interval.pl


before ==
from sympy import solveset, S
x = Symbol('x')
a, b = sampleint(-6, 6, 2)
expr = (x + a) * (x + b)
ineq = choice([expr >= 0, expr > 0, expr <= 0,expr < 0])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

keypad % [{"label": "$! \\infty !$", "action": "cmd", "value": "\\infty"}, {"label": "$! \\cup !$", "action": "cmd", "value": "\\cup"}]