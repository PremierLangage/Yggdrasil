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
    if c==0:
        p=randint(2,5)
        q=choice([2,3,4,5,7,9])
        sol=sqrt(p**2*q)
        expr=r"%d \sqrt{ %d }" % (p,q)
    elif c==1:
        p=randint(2,3)
        q,r=sample([2,3,4,5,7,9], 2)
        sol=sqrt(p**2*q*r)
        expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
    elif c==2:
        p=randint(2,4)
        q,r=sample([2,3,4,5,7,9], 2)
        sol=sqrt(p**2*q/r)
        expr=r"%d \frac{ \sqrt{ %d } }{ \sqrt{ %d } }" % (p,q,r)
    return expr, sol

prefixes = []
for i in range(n):
    expr, sol = generate(param['types'][i])
    prefixes.append(f"$! \displaystyle {expr} = !$")
    inputs[i].sol = simplify(sol)
==

question ==
Ecrire les expressions suivantes sous la forme  $% \sqrt{a} %$, où $% a %$ est un nombre.
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
    if not isinstance(ans, sp.Pow):
        return (-1, "WrongForm")
    if isinstance(ans, sp.Pow) and ans.args[0].has(sp.Pow):
        return (-1, "WrongForm")
    if not equal(ans, sol):
        return (0, "NotEqual")
    #if not is_rat_simp(ans):
    #    return (-1, "NotRatSimp")
    return (100, "Success")


for input in inputs:
    input.value = answers[input.id] # HACK
    input.score, error = eval_ans(input.value, input.sol)
    input.feedback = message[error]
==
