extends = /model/mathinput.pl

title = Equation avec valeur abolue

before ==
a,b=list_randint(2,-6,6,[0,1,-1])
d=randint(1,5)
var('x')
lhs=Abs(a*x+b)
lstsol=list(solveset(Eq(lhs,d),x,domain=S.Reals))
solution=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(lstsol[0]),latex(lstsol[1]))
==

text ==
Déterminer la ou les solutions de l'équation $$ {{lhs|latex}} = {{d}}. $$
Séparer les différentes solutions par une virgule.
==

evaluator ==
score, error = eval_set(input.value, lstsol, wobracket=True)
feedback = feedback_message[error]
==
