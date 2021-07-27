extends = /model/math/input.pl

before ==
from sympy import S, solveset, Intersection

var('x')
a, c = sampleint(-6, 6, 2, [0])
b, d = sampleint(-6, 6, 2, [-1, 0, 1])
f=a*x+b
if param['otherside1']=='zero':
    g=0
if param['otherside1']=='constant':
    g=d
if param['otherside1']=='linear':
    g=c*x+d
ineq1=choice([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])

a, c = sampleint(-6, 6, 2, [0])
b, d = sampleint(-6, 6, 2, [-1, 0, 1])
f=a*x+b
if param['otherside2']=='zero':
    g=0
if param['otherside2']=='constant':
    g=d
if param['otherside2']=='linear':
    g=c*x+d
ineq2=choice([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])

sol1=solveset(ineq1,x,domain=S.Reals)
sol2=solveset(ineq2,x,domain=S.Reals)
sol=Intersection(sol1,sol2)
==

embed ==
# {{expr|latex}} #
==

question ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq1|latex}}\quad\text{ et }\quad{{ineq2|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle (ou de l'ensemble vide).
==
