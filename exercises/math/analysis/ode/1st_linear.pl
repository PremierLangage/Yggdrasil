extends = /model/math/multimathinput.pl

title = Déterminer une solution particulière

before ==
from sympy import Function
var('t')
var('k')
y = symbols('y', cls=Function)
a = randint(-3, 3, [0])
b = randint(-3, 3, [0])
expr = y(t).diff(t) + a*y(t) + b
==

question ==
Considérons l'équation
==

inputblock ==
1. Déterminer une solution particulière constante.
{{ inputs[0]|html }}
2. Déterminer une solution générale
{{ inputs[1]|html }}
3. Déterminer la solution telle que 
{{ inputs[2]|html }}
==

evaluator ==#|py|

import sympy as sp
from sympy.calculus.util import function_range
from latex2sympy import latex2sympy
from evalsympy import eval_expr

def eval_ans0(strans, expr):
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

def eval_ans1(strans, expr):
    try:
        ans = latex2sympy(strans, local_dict={'e':sp.E})
    except:
        return (-1, "NotExpr")
    try:
	    res = sp.checkodesol(expr, ans)
    except:
        return (-1, "NotExpr")
    if not res[0]:
	    return (0, str(res[1]))
    y0 = ans.subs(t, 0)
    if function_range(y0, k, sp.S.Reals) != sp.S.Reals:
        return (0, "NotGenSol")
    return (100, "Success")

def eval_expr(strans, sol, local_dict={'e':sp.E}):
    try:
        ans = latex2sympy(strans, local_dict={'e':sp.E})
    except:
        return (-1, "NotExpr")
    try:
	    res = sp.checkodesol(expr, ans)
    except:
        return (-1, "NotExpr")
    if not res[0]:
	    return (0, str(res[1]))
    y0 = ans.subs(t, 0)
    if function_range(y0, k, sp.S.Reals) != sp.S.Reals:
        return (0, "NotGenSol")
    return (100, "Success")

score, error = eval_ans(input.value, expr)
feedback = error #message[error]

for input in inputs:
    input.value = answers[input.id] # HACK
    input.eval()
==


evaluator ==
import sympy as sp
from sympy.calculus.util import function_range
from latex2sympy import latex2sympy

def eval_ans(strans, expr):
    try:
        ans = latex2sympy(strans, local_dict={'e':sp.E})
    except:
        return (-1, "NotExpr")
    try:
	    res = sp.checkodesol(expr, ans)
    except:
        return (-1, "NotExpr")
    if not res[0]:
	    return (0, str(res[1]))
    y0 = ans.subs(t, 0)
    if function_range(y0, k, sp.S.Reals) != sp.S.Reals:
        return (0, "NotGenSol")
    return (100, "Success")

score, error = eval_ans(input.value, expr)
feedback = error #message[error]
==

prefix ==
$! y'(t) = !$
==

message.NotSol = "La réponse n'est pas une solution de l'équation."
message.NotGenSol = "La réponse n'est pas une solution générale de l'équation."