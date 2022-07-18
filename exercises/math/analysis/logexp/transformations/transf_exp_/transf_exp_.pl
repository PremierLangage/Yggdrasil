# Author: D. Doyen
# Tags: exponential
# Transformer des expressions avec exponentielle
# 19/7/2021

extends = /model/math/multimathinput.pl

param.transformations = [0, 1, 2, 3]

before ==
from sympy import evaluate, UnevaluatedExpr
n = len(param['transformations'])
inputs = [MathInput(type="expr", evalparam={'embedfunc': exp(3)}) for _ in range(n)]

def generate(c):
    p, q = sample([-5, -4, -3, -2, 2, 3, 4, 5], 2)
    u = randint(2,4)
    with evaluate(False):
        lst_expr = [(exp(p))**u,
        1/(exp(p))**u,
        UnevaluatedExpr(exp(p))*UnevaluatedExpr(exp(q)),
        UnevaluatedExpr(exp(p))/(exp(q))]
        expr = lst_expr[c]
    return expr, expr

prefixes = []
for i in range(n):
    expr, sol = generate(param['transformations'][i])
    prefixes.append(f"$! \displaystyle {latex(expr)} = !$")
    inputs[i].sol = simplify(sol)
==

question ==
Ecrire les expressions suivantes sous la forme  $! e^a !$, où $! a !$ est un nombre.
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
    if not isinstance(ans, (sp.exp, type(sp.E))):
        return (-1, "WrongForm")
    if isinstance(ans, sp.exp) and ans.args[0].has(sp.exp):
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


wims ==

p, q = sample([-5,-4,-3,-2,2,3,4,5], 2)
formula = choice(eval(param['formulas']))
if formula=="(exp(p))^u":
    u=randint(2,4)
    sol=p*u
    expr="(\exp( %d ))^{ %d }" % (p,u)
elif formula=="1/(exp(p))^u":
    u=randint(-4,-2)
    sol=-p*u
    expr=r"\frac{1}{(\exp( %d ))^{ %d }}" % (p,u)
elif formula=="exp(p)*exp(q)":
    sol=p+q
    expr=r"\exp( %d ) \times \exp( %d )" % (p,q)
elif formula=="exp(p)/exp(q)":
    sol=p-q
    expr=r"\frac{\exp( %d )}{\exp( %d )}" % (p,q)

\if{\type=55}{
\integer{u=randitem(-1,1)*randint(2..4)}
\text{expr=randitem((exp(\p))^{\u} \times exp(\q),exp(\q) \times (exp(\p))^{\u})}
\text{a=simplify((\p)*(\u) +\q)}
}
\if{\type=56}{
\integer{u=randitem(-1,1)*randint(2..4)}
\if{randitem(1,2)=1}{
\text{expr=\frac{(exp(\p))^{\u}}{exp(\q)}}
\text{a=simplify(\p*(\u)-(\q))}
}{
\text{expr=\frac{exp(\q)}{(exp(\p))^{\u}}}
\text{a=simplify(\q-(\p)*(\u))}
}
}
\if{\type=57}{
\text{l1=shuffle(2,3,4)}
\integer{u=randitem(-1,1)*\l1[1]}
\integer{v=randitem(-1,1)*\l1[2]}
\text{expr=(exp(\p))^{\u} \times (exp(\q))^{\v}}
\text{a=simplify((\p)*(\u)+(\q)*(\v))}
}
\if{\type=58}{
\text{l1=shuffle(2,3,4)}
\integer{u=randitem(-1,1)*\l1[1]}
\integer{v=randitem(-1,1)*\l1[2]}
\text{expr=\frac{(exp(\p))^{\u}}{(exp(\q))^{\v}}}
\text{a=simplify((\p)*(\u)-(\q)*(\v))}
}
\if{\type=59}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\text{expr=randitem(exp(\p)\times \q,\q \times exp(\p))}
\text{a=simplify(\p+ln(\q))}
}
\if{\type=60}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\if{randitem(1,2)=1}{
\text{expr=\frac{exp(\p)}{\q}}
\text{a=simplify(\p-ln(\q))}
}{
\text{expr=\frac{\q}{exp(\p)}}
\text{a=simplify(ln(\q)-\p)}
}
}
\if{\type=61}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\integer{u=randitem(-1,1)*randint(2..4)}
\text{expr=randitem(exp(\p)^{\u}\times \q,\q \times exp(\p)^{\u})}
\text{a=simplify((\p)*(\u)+ln(\q))}
}
\if{\type=62}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\integer{u=randitem(-1,1)*randint(2..4)}
\if{randitem(1,2)=1}{
\text{expr=\frac{exp(\p)^{\u}}{\q}}
\text{a=simplify((\p)*(\u)-ln(\q))}
}{
\text{expr=\frac{\q}{exp(\p)^{\u}}}
\text{a=simplify(ln(\q)-(\p)*(\u))}
}
}

==


