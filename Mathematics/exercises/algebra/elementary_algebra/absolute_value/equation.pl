extends = /Mathematics/template/mathexpr.pl

title = Equation avec valeur abolue

lang = fr

before ==
a,b=list_randint(2,-6,6,[0,1,-1])
d=randint(1,5)
var('x')
lhs=Abs(a*x+b)
lstsol=list(solveset(Eq(lhs,d),x,domain=S.Reals))
latexlhs=latex(lhs)
==

text ==
Déterminer la ou les solutions de l'équation $$ {{latexlhs}} = {{d}}. $$
==

evaluator==
score,_,feedback=ans_list_frac(answer['1'],lstsol)
feedback=lstsol
==


