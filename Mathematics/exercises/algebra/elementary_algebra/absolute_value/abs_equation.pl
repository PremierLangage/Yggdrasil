extends = /Mathematics/template/mathexpr.pl

title = Equation avec valeur abolue

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

a,b=list_randint(2,-6,6,[0,1,-1])
d=randint(1,5)
var('x')
lhs=Abs(a*x+b)
lstsol=list(solveset(Eq(lhs,d),x,domain=S.Reals))
latexlhs=latex(lhs)

solution=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(lstsol[0]),latex(lstsol[1]))

==

text ==
Déterminer la ou les solutions de l'équation $$ {{latexlhs}} = {{d}}. $$
Séparer les différentes solutions par une virgule.
==

evaluator==
score,_,feedback=ans_set_expr(input1.value,lstsol,formal=False)
==






