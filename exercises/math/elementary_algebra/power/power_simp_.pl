# Author: D. Doyen
# Tags: exponential
# Transformer des expressions avec exponentielle
# 19/7/2021

# Author: D. Doyen
# Tags: exponential
# Transformer des expressions avec exponentielle
# 19/7/2021

extends = /model/math/multimathinput.pl

param.transformations = [0, 1, 2, 3]

before ==
from sympy import evaluate, UnevaluatedExpr, Pow
from latex2sympy import latex2sympy
n = len(param['transformations'])
inputs = [MathInput(type="expr", evalparam={'embedfunc': exp(3)}) for _ in range(n)]
var('a')

def generate(c):
    p, q = sample([-5, -4, -3, -2, 2, 3, 4, 5], 2)
    u = randint(2,4)
    with evaluate(False):
        lst_expr = [r" \left(%s ^{ %d } \right)^{ %d }" % ('a', p, u),
        r" \frac{1}{ \left(%s ^{ %d } \right)^{ %d }}" % ('a', p, u),
        r"%s ^{ %d } \times %s ^{ %d }" % ('a', p, 'a', q),
        r"\frac{ %s ^{ %d } }{ %s ^{ %d } }" % ('a', p, 'a', q)]
        expr = lst_expr[c]
    return expr, simplify(latex2sympy(expr))

prefixes = []
for i in range(n):
    expr, sol = generate(param['transformations'][i])
    prefixes.append(f"$! \displaystyle {expr} = !$")
    inputs[i].sol = simplify(sol)
==

question ==
Ecrire les expressions suivantes sous la forme  $! a^n !$, où $! n !$ est un nombre.
==

evaluator ==#|py|
import sympy as sp
from evalsympy import equal, is_rat_simp
from latex2sympy import latex2sympy

def eval_ans(strans, sol):
    try:
        ans = latex2sympy(strans, {'e':sp.E})
    except:
        return (-1, "NotExpr")
    if not isinstance(ans, sp.Expr):
        return (-1, "NotExpr")
    if not isinstance(ans, (sp.Pow, sp.Integer)):
        return (-1, "WrongForm")
    if isinstance(ans, sp.Pow) and ans.args[0] != a:
        return (-1, "WrongForm")
    if not equal(ans, sol):
        return (0, "NotEqual")
    if not is_rat_simp(ans):
        return (-1, "NotRatSimp")
    return (100, "Success")


for input in inputs:
    input.value = answers[input.id] # HACK
    input.score, error = eval_ans(input.value, input.sol)
    input.feedback = message[error]
==


before3 == #|py|
from sympy.ntheory.factor_ import core
from sympy import fraction
n = len(param['types'])
inputs = [MathInput(type="expr") for _ in range(n)]

x=randint(2,3)

def generate(c, x):
    ok=False
    while not ok:
        n1=randint(-4,6,[0,1])
        n2=randint(-4,6,[0,1])
        na,nb=sampleint(1, 3, 2)
        a=x**na
        b=x**nb
        if c == 0:
            expr = r"%d ^{ %d } \times %d ^{ %d }" % (a,n1,b,n2)
            n=na*n1+nb*n2
        elif c == 1:
            expr = r"\displaystyle \frac{ %d ^{ %d }}{ %d ^{ %d } }" % (a,n1,b,n2)
            n=na*n1-nb*n2
        if n!=0 and n!=1:
            ok=True
    return expr, x**n

prefixes = []
for i in range(n):
    expr, sol = generate(param['types'][i], x)
    prefixes.append(f"$! \displaystyle {expr} = !$")
    inputs[i].sol = simplify(sol)
==

