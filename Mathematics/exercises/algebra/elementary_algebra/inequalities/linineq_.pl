# Author: D. Doyen
# Tags: inequalities
# 19/8/2020

extends = /model/math/interval.pl

title = Inéquation linéaire

param.otherside = constant

before ==
drom sympy import S, solveset
a, c = sample(list(range(-6,-1)) + list(range(2,7)), 2)
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

input.virtualKeyboards = sets

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==

evaluator==
score, error = eval_rset(input.value, sol)
feedback = message[error]
==

solution==
Cet ensemble est $! {{sol|latex}} !$.
==








