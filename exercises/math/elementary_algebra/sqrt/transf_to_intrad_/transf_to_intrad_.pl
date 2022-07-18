# Author: D. Doyen
# Tags: exponential
# Transformer des expressions avec exponentielle
# 19/7/2021

extends = /model/math/multimathinput.pl

param.types = [0, 1, 2]

title = Transformation avec racine carrée


before == #|py|
from sympy.ntheory.factor_ import core
from sympy import fraction
n = len(param['types'])
inputs = [MathInput(type="expr") for _ in range(n)]

def generate(c):
    a, b = 1, 1
    while a==1 or b==1:
        if c==0:
            p=randint(50,200)
            v=p
            expr=r"\sqrt{ %d }" % (p)
        elif c==1:
            p=randint(5,10)
            q,r=sample([2,3,5,6,7,8,10,11,12,13,14,15,18,20,21,22,24,26,27,28], k=2)
            v=p**2*q*r
            expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
        elif c==2:
            p=randint(2,6)
            q,r= sample([2,3,5,6,7,8,10,11,12], k=2)
            v=p**2*Rational(q,r)
            expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
        v1,v2=fraction(v)
        b=core(v1)
        a=Rational(int(sqrt(v1/b)),v2)
    return expr, a*sqrt(b)

prefixes = []
for i in range(n):
    expr, sol = generate(param['types'][i])
    prefixes.append(f"$! \displaystyle {expr} = !$")
    inputs[i].sol = simplify(sol)
==


question ==
Ecrire les expression ssuivantes sous la forme  $! a \sqrt{b} !$, où $! a !$ est un entier et $! b !$ est le plus petit entier positif possible.
==

evaluator== #|py|
from latex2sympy import latex2sympy
from evalsympy import equal
from sympy import log, sqrt
import sympy as sp
def eval_ans(strans, sol):
    try:
        ans = latex2sympy(strans)
    except:
        return (-1, "NotExpr")
    if ans.func != sp.Mul:
        return (-1, "WrongForm")
    if len(ans.args) > 2:
        return (-1, "WrongForm")
    if not (ans.args[0].func == sp.Pow and ans.args[1] != 1) and not (ans.args[1].func == sp.Pow and ans.args[0] !=1):
        return (-1, "WrongForm")
    if not equal(ans, sol):
        return (0, "NotEqual")
    return (100, "Success")

for input in inputs:
    input.value = answers[input.id] # HACK
    input.score, error = eval_ans(input.value, input.sol)
    input.feedback = message[error]
==