extends = /model/math/set.pl

title = Equation trigonométrique

param.rhs = [0,-1,1]

param.interval = [(-2*pi,2*pi),(0,2*pi),(-pi,pi)]

param.interval_type = closed

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
sur l'intervalle $! {{ interv|latex }} !$. Quand il y a plusieurs solutions, les séparer par des virgules.
==

evaluator ==
score, error = eval_set(input.value, sol, wobracket=True)
feedback = feedback_message[error]
==

solution ==
Solution : $${{sol|latex}}$$
==







