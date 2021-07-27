extends = /model/math/input.pl

before ==
from sympy import S, solveset, Intersection

var('x')
a, c = sampleint(-6, 6, 2, [0])
b, d = sampleint(-6, 6, 2, [-1, 0, 1])
f=a*x+b


#sol1=solveset(ineq1,x,domain=S.Reals)
#sol2=solveset(ineq2,x,domain=S.Reals)
sol=Intersection(1,2)
==

embed ==
# {{f|latex}} #
==

question ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq1|latex}}\quad\text{ et }\quad{{ineq2|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle (ou de l'ensemble vide).
==
