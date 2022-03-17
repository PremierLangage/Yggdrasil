# D. Doyen
# 17/3/2020
# inequalities
# Résoudre une inéquation linéaire

extends = /model/math/interval.pl

# Paramètres

param.otherside = "zero"

# Autres clés

before ==
from sympy import S, solveset

a, c = sampleint(-6, 6, 2, [0])
b, d = sampleint(-6, 6, 2, [-1, 0, 1])
var('x')
f = a*x+b

if param['otherside'] == 'zero':
    g = 0
if param['otherside'] == 'cst':
    g = d
if param['otherside'] == 'aff':
    g = c*x + d

ineq = choice([f>=g, f>g, f<=g, f<g, g>=f, g>f, g<=f, g<f])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==