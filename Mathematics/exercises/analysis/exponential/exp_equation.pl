extends = /model/mathinput.pl

title = Equation avec exponentielle

before ==
var('x')
a,b=list_randint(2,-8,8,[0])
lhs = exp(a*x+b)
rhs = randint(1,8)
sol = list(solveset(lhs-rhs,x,domain=S.Reals))[0]
==

text ==
Déterminer la solution de l'équation $$ {{lhs|latex}} = {{rhs|latex}}.$$
==


evaluator==
score,_,feedback=ans_expr(input1.value,sol,{'e':sp.E},{sp.ln})
==

solution ==
La solution est $%{{sol_tex}}%$.
==



