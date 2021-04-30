# Author: D. Doyen
# Tags: inequalities
# 19/8/2020

extends = /model/math/interval.pl

title = Résoudre une inéquation linéaire

param.otherside = constant

before ==
from plrandom import sampleint
from sympy import S, solveset
a, c = sample(list(range(-6,-1)) + list(range(2,7)), 2)
a, c = sampleint(-6, 6, 2, [0])
b, d = sample(list(range(-6,0)) + list(range(1,7)), 2)
var('x')
f=a*x+b
if param['otherside'] == 'zero':
    g=0
if param['otherside'] == 'constant':
    g=d
if param['otherside'] == 'linear':
    g=c*x+d
ineq=choice([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])
sol=solveset(ineq,x,domain=S.Reals)
==


text ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==