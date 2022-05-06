# Author: D. Doyen
# Tags: logarithm
# Transformer des expressions avec logarithme
# 19/7/2021

extends = /model/math/multimathinput.pl

param.types = [0, 1, 2, 3]

before ==
n = len(param['types'])
inputs = [MathInput(type="expr", evalparam={'embedfunc': ln(2)}) for _ in range(n)]

def generate(c):
    p, q = sampleint(2, 5, 2)
    u, v = sampleint(2, 4, 2)
    lst_expr = [ln(p) + ln(q),
    ln(p) - ln(q),
    u*ln(p),
    -u*ln(p),
    choice([u*ln(p) + ln(q), ln(p) + v*ln(q)]),
    choice([u*ln(p) - ln(q), ln(p) - v*ln(q)]),
    u*ln(p) + v*ln(q),
    u*ln(p) - v*ln(q)]
    expr = lst_expr[c]
    return expr, expr

prefixes = []
for i in range(n):
    expr, sol = generate(param['types'][i])
    prefixes.append(f"$! {latex(expr)} = !$")
    inputs[i].sol = ln(simplify(E**expr))
==

question ==
Ecrire les expressions suivantes sous la forme  $! \ln(a) !$, où $! a !$ est un nombre.
==

evaluator ==#|py|
from evalsympy import equal, is_rat_simp
from latex2sympy import latex2sympy

def eval_ans(strans, sol):
    try:
        ans = latex2sympy(strans, {'e':E})
    except:
        return (-1, "NotExpr")
    if not isinstance(ans, sp.Expr):
        return (-1, "NotExpr")
    if not isinstance(ans, ln):
            return (-1, "NotExpr")
    if not equal(ans, sol, modulo):
            return (0, "NotEqual")
    if not is_rat_simp(ans):
        return (-1, "NotRatSimp")
    return (100, "Success")


for input in inputs:
    input.value = answers[input.id] # HACK
    input.score, input.feedback = eval_ans(input.value, input.sol)
==




wims ==


\if{\type=9}{
\text{typerep=algexp}
\text{expr=choice(ln(\p)+\q,\q+ln(\p))}
\text{a=simplify(\p*exp(\q))}
}
\if{\type=10}{
\text{typerep=algexp}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=choice(\s1*ln(\p)+\s2*\q,\s2*\q+\s1*ln(\p))}
\text{a=simplify(exp(\expr))}
}
\if{\type=11}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{expr=choice(\u*ln(\p)+\q,\q+\u*ln(\p))}
\text{a=simplify(\p^(\u)*exp(\q))}
}
\if{\type=12}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=choice(\s1*\u*ln(\p)+\s2*\q,\s2*\q+\s1*\u*ln(\p))}
\text{a=simplify(exp(\expr))}
}



==






