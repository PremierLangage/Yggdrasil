extends = /model/math/input_eval.pl

title = Déterminer une solution particulière

before ==
from sympy import Function
var('t')
y = symbols('y', cls=Function)
a = randint(-3, 3, [0])
b = randint(-3, 3, [0])
expr = y(t).diff(t) + a*y(t) + b
==

question ==
Déterminer une solution particulière $! {{ expr|latex }} = 0 !$.
==

evaluator ==
import sympy as sp
from latex2sympy import latex2sympy

def eval_ans(strans, expr):
    try:
        ans = latex2sympy(strans)
    except:
        return (-1, "NotExpr")
    try:
	    res = sp.checkodesol(expr, ans)
    except:
        return (-1, "NotExpr")
    if not res[0]:
	    return (0, "NotSol")
    return (100, "Success")

score, error = eval_ans(input.value, expr)
feedback = message[error]
==

prefix ==
$! y'(t) = !$
==

message.NotSol = "La réponse n'est pas une solution particulière de l'équation."

message.NotLinEq = "La réponse n'est pas une équation de droite."
