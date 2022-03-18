# D. Doyen
# 17/3/2022
# inequalities
# Résoudre une inéquation linéaire

extends = /model/math/interval.pl

title = Iinéquation linéaire

# Paramètres

param.otherside = "zero"

# Autres clés

before == #|py|
from sympy import S, solveset

var('x')
a = randint(-6, 6, [-1, 0, 1])
b = randint(-6, 6, [0])
c = randint(-6, 6, [-1, 0, 1, a])
d = randint(-6, 6, [0, b])
f = a*x + b

g = d

ineq = choice([f>=g, f>g, f<=g, f<g, g>=f, g>f, g<=f, g<f])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==

embed ==
==

evaluator ==
input.sol = sol
ans = input.get_value()
input.display_feedback()
if score >= 0:
  input.disable()
==

keypad = ["+infty", "-infty"]