extends = /model/math/input0.pl

input_type = "chainineq"

evalparam ==
input.evalparam = {}
==

jinja_keys = ["question", "text", "inputblock", "solution", "prefix", "embed"]

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

process ==
from jinja_env import Env
from sympy2latex import latex_chainineq
embed = Env.from_string(embed).render(locals())
input.set_embed(embed)
sol_chainineq = latex_chainineq(expr, sol)
==

embed ==
# \ {{ expr|latex }} \ #
==


solution ==
$! {{ sol_chainineq }} !$
==