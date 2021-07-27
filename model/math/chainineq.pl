extends = /model/math/input.pl

jinja_keys % ["question", "text", "inputblock", "solution", "prefix", "embed"]

before ==
from sympy import S, solveset, Intersection

var('x')
a, c = sampleint(-6, 6, 2, [0])
b, d = sampleint(-6, 6, 2, [-1, 0, 1])
f=a*x+b


#sol1=solveset(ineq1,x,domain=S.Reals)
#sol2=solveset(ineq2,x,domain=S.Reals)
sol=Interval(1,2)
==

embed ==
# {{f|latex}} #
==

evaluator ==
from latex2sympy import latex2sympy
from sympy import S, solveset, Intersection
var('x')
b1, b2 = answers['math'].split(',')

try:
    S1 = solveset(latex2sympy(b1 + ' x'),x,domain=S.Reals))
    S2 = solveset(latex2sympy('x ' + b2),x,domain=S.Reals))
except:
    pass

feedback = str(latex2sympy(b1 + ' x')) # str(Intersection(S1, S2))
score = -1
==

question ==
Déterminer l'ensemble des réels $% x %$.
==
