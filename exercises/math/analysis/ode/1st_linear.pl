extends = /model/math/multimathinput.pl

title = Déterminer une solution particulière

before ==
inputs = [MathInput(type="expr") for _ in range(3)]
from sympy import Function
var('t')
var('k')
y = symbols('y', cls=Function)
a = randint(-3, 3, [0])
b = randint(-3, 3, [0])
rhs = a*y(t) + b
expr = y(t).diff(t) - rhs
y0 = randint(-2, 2)
==

question ==
Considérons l'équation $! {{expr|latex}} !$
==

inputblock ==
1. Déterminer une solution particulière constante de cette équation.<br><br>
$! y_{p}(t) = !$ {{ inputs[0]|html }}
<br><br>
2. Déterminer une solution générale de cette équation. On utilisera la lettre $! k !$ pour désigner un paramètre réel libre.<br><br>
$! y(t) = !$ {{ inputs[1]|html }}
<br><br>
3. Déterminer l'unique solution $g$ de cette équation telle que $! g(0) = {{y0|latex}} !$.<br><br>
$! g(t) = !$ {{ inputs[2]|html }}
==

solution ==

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
    ans0 = ans.subs(t, 0)
    if function_range(ans0, k, sp.S.Reals) != sp.S.Reals:
        return (0, "NotGenSol")
    return (100, "Success")

def eval_ans2(strans, expr):
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
    ans0 = ans.subs(t, 0)
    if sp.simplify(ans0-y0) != 0 :
        return (0, "NotInitValue")
    return (100, "Success")



for input in inputs:
    input.value = answers[input.id] # HACK

score, error = eval_ans0(inputs[0].value, expr)
feedback = error #message[error]
inputs[0].feedback = feedback
inputs[0].score = score

score, error = eval_ans1(inputs[1].value, expr)
feedback = error #message[error]
inputs[1].feedback = feedback
inputs[1].score = score

score, error = eval_ans2(inputs[2].value, expr)
feedback = error #message[error]
inputs[2].feedback = feedback
inputs[2].score = score
==


evaluator2 ==
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