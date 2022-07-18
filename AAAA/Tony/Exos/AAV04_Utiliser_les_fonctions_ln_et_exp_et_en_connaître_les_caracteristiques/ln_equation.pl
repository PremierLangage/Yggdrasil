extends = /model/mathinput.pl

title = Equation avec logarithme

before ==
var('x')
a,b=list_randint(2,-8,8,[0])
lhs = ln(a*x+b)
rhs =randint(-8,8,[0])
sol=list(solveset(lhs-rhs,x,domain=S.Reals))[0]
==

text ==
Déterminer la solution de l'équation $$ {{lhs|latex}} = {{rhs|latex}}.$$
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = feedback_message[error]
==

solution ==
La solution est $! {{ sol|latex }} !$.
==

