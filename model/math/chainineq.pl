extends = /model/math/input.pl

jinja_keys % ["question", "text", "inputblock", "solution", "prefix", "embed"]

before ==
from sympy import S, solveset, Intersection

var('x')
a, c = sampleint(-6, 6, 2, [0])
b, d = sampleint(-6, 6, 2, [-1, 0, 1])
expr=a*x+b


#sol1=solveset(ineq1,x,domain=S.Reals)
#sol2=solveset(ineq2,x,domain=S.Reals)
sol = Interval(1,2)
==

embed ==
# \ {{ expr|latex }} \ #
==

evaluator ==
from evalsympy import eval_chainineq
score, error = eval_chainineq(answers['math'], sol)
feedback = message[error]
==


solution ==

==
