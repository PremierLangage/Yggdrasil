#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat = A débugger
extends = /model/math/expr.pl

title = Inéquation avec valeur absolue

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

a,b=list_randint(2,-6,6,[0,1,-1])
d=randint(1,5)
var('x')
expr=Abs(a*x+b)

ineq=randitem([expr>=d,expr>d,expr<=d,expr<d])
ineq_tex = latex(ineq)
sol=solveset(ineq,x,domain=S.Reals)
sol_tex = latex(sol)
==

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq_tex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

evaluator==
score,_,feedback=ans_rset(input1.value,sol)
==

solution ==
La solution est $% {{sol_tex}} %$.
==



