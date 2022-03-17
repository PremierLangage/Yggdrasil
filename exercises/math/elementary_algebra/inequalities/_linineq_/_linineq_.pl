# D. Doyen
# 17/3/2022
# inequalities
# Résoudre une inéquation linéaire

extends = /model/math/interval.pl

# Paramètres

param.otherside = "zero"

# Autres clés

before == #|py|
from sympy import S, solveset

a, c = sampleint(-6, 6, 2, [-1, 0, 1])
b, d = sampleint(-6, 6, 2, [-1, 0, 1, a])
var('x')
f = a*x + b

if param['otherside'] == 'zero':
    g = 0
elif param['otherside'] == 'cst':
    g = d
elif param['otherside'] == 'aff':
    g = c*x + d
else:
    raise ValueError("Incorrect value for parameter otherside.")

ineq = choice([f>=g, f>g, f<=g, f<g, g>=f, g>f, g<=f, g<f])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==