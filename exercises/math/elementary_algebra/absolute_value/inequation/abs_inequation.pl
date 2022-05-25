extends = /Mathematics/template/mathexpr.pl

title = Inéquation avec valeur absolue

lang = fr

before ==
a,b=list_randint(2,-6,6,[0,1,-1])
d=randint(1,5)
var('x')
expr=Abs(a*x+b)

ineq=rchoice([expr>=d,expr>d,expr<=d,expr<d])
ineq_tex = latex(ineq)
sol=solveset(ineq,x,domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==