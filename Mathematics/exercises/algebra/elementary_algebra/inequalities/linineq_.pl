# Author: D. Doyen
# Tags: inequalities
# 19/8/2020

extends = /model/math/interval.pl

param.otherside = constant

before ==
from sympy import S, solveset
a, c = sampleint(-6, 6, 2, [0])
b, d = sampleint(-6, 6, 2, [-1, 0, 1])
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


question ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==