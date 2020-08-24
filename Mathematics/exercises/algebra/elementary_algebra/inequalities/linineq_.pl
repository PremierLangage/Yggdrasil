# Author: D. Doyen
# Tags: complex numbers
# 19/8/2020

title = Inéquation linéaire

before ==
a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint(2,-6,6,[0])
var('x')
f=a*x+b
if param['otherside']=='zero':
    g=0
if param['otherside']=='constant':
    g=d
if param['otherside']=='linear':
    g=c*x+d
ineq=randitem([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])
sol=solveset(ineq,x,domain=S.Reals)
latexineq=latex(ineq)
sol_tex=latex(sol)
==

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{latexineq}}. $$ Ecrire cet ensemble sous la forme d'un intervalle.
==

evaluator==
score,_,feedback=ans_rset(input1.value,sol)
==

solution==
Cet ensemble est $! {{sol_tex}} !$.
==







