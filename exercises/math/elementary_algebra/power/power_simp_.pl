# Author: D. Doyen
# Tags: exponential
# Transformer des expressions avec exponentielle
# 19/7/2021

extends = /model/math/multimathinput.pl

param.types = [0, 1]

title = Transformation avec racine carrée


before == #|py|
from sympy.ntheory.factor_ import core
from sympy import fraction
n = len(param['types'])
inputs = [MathInput(type="expr") for _ in range(n)]

def generate(c):
    while not ok:
        x=randint(2,3)
        n1=randint(-4,6,[0,1])
        n2=randint(-4,6,[0,1])
        na,nb=list_randint_norep(2,1,3)
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
    return expr, n

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
    if not is_rat_simp(ans):
        return (-1, "NotRatSimp")
    return (100, "Success")


for input in inputs:
    input.value = answers[input.id] # HACK
    input.score, error = eval_ans(input.value, input.sol)
    input.feedback = message[error]
==


before== #|python|
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

ok=False


sol_tex=" %s ^{ %s }" % (x,n)
==


text== #|html|
Simplifier l'expression $% {{expr}} %$ en l'écrivant sous la forme $% {{x}}^n %$, où $% n %$ est un entier.
==


evaluator== #|python|

def ans_eval(strans,x,n):
    try:
        ans=str2expr(strans)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas sous la forme attendue")
    if type(ans)!=sp.Pow:
        return (-1,"","Votre réponse n'est pas sous la forme attendue")
    if ans.args[0]!=x:
        return (-1,"","Votre réponse n'est pas sous la forme attendue")
    if ans.args[1]!=n:
        return (0,"","")
    return (100,"","")

score,_,feedback=ans_eval(input1.value,x,n)
==

solution ==
La solution est $! {{sol_tex}} !$.
==




