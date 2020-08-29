extends = /model/mathinput.pl

title = Equation trigonométrique

before ==
var('x')
lhs = randitem([cos(x),sin(x)])
rhs =randitem(eval(param['rhs']))
a,b=randitem(eval(param['interval']))
interv=Interval(a,b)
sol=solveset(lhs-rhs,x,domain=S.Reals).intersect(interv)
==

text ==
Déterminer la ou les solutions de l'équation $$ {{ lhs|latex }} = {{ rhs|latex }} $$
sur l'intervalle $% {{ interv|latex }} %$. Quand il y a plusieurs solutions, les séparer par des virgules.
==

evaluator==
score,_,feedback=ans_set_expr(input1.value,sol,formal=False)
==

solution ==
Solution : $${{sol|latex}}$$
==







