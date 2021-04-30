extends = /model/math/interval.pl

title = Résoudre un système d'inéquations linéaires

before ==
a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint(2,-6,6,[0])
var('x')
f=a*x+b
if param['otherside1']=='zero':
    g=0
if param['otherside1']=='constant':
    g=d
if param['otherside1']=='linear':
    g=c*x+d
ineq1=randitem([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])

a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint(2,-6,6,[0])
var('x')
f=a*x+b
if param['otherside2']=='zero':
    g=0
if param['otherside2']=='constant':
    g=d
if param['otherside2']=='linear':
    g=c*x+d
ineq2=randitem([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])

sol1=solveset(ineq1,x,domain=S.Reals)
sol2=solveset(ineq2,x,domain=S.Reals)
sol=Intersection(sol1,sol2)
==

input.virtualKeyboards = sets

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq1|latex}}\quad\text{ et }\quad{{ineq2|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle (ou de l'ensemble vide).
==

evaluator==
score, error = eval_rset(input.value, sol)
feedback = message[error]
==

solution==
Cet ensemble est $! {{sol|latex}} !$.
==



