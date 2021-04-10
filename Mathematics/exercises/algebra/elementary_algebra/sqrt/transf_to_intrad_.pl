extends = /model/math/input.pl

title = Transformation d'écritures avec racine carrée

before ==
from sympy.ntheory.factor_ import core
from sympy import fraction
a,b=1,1
while a==1 or b==1:
    if param['form']=="sqrt(p)":
        p=randint(50,200)
        v=p
        expr=r"\sqrt{ %d }" % (p)
    elif param['form']=="p sqrt(q) sqrt(r)":
        p=randint(5,10)
        q,r=sample([2,3,5,6,7,8,10,11,12,13,14,15,18,20,21,22,24,26,27,28], k=2)
        v=p**2*q*r
        expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
    elif param['form']=="p sqrt(q)/sqrt(r)":
        p=randint(2,6)
        q,r= sample(2,[2,3,5,6,7,8,10,11,12], k=2)
        v=p**2*Rational(q,r)
        expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
    v1,v2=fraction(v)
    b=core(v1)
    a=Rational(int(sqrt(v1/b)),v2)
sol=a*sqrt(b)
==

text ==
Ecrire $! {{expr}} !$ sous la forme  $% a \sqrt{b}%$, où $%a%$ est un entier et $%b%$ est le plus petit entier positif possible.
==

evaluator==
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
    if not (ans.args[0].func == sp.Pow and ans.args[1] != 1) and not (ans.args[1].func == sp.Pow and ans.args[0] !=1):
        return (-1, "WrongForm")
    if not equal(ans, sol):
        return (0, "NotEqual")
    return (100, "Success")

score, error = eval_ans(answers['math'], sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==