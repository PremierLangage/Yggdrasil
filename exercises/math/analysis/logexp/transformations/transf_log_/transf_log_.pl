# Author: D. Doyen
# Tags: logarithm
# Transformer des expressions avec logarithme
# 19/7/2021

extends = /model/math/multimathinput.pl

param.types = [2, 3, 0, 1]

before ==
n = len(param['types'])
inputs = [MathInput(type="complex", evalparam={'form': 'cartesian'}) for _ in range(n)]

def generate(c):
    p, q = sampleint(2, 5, 2)
    u, v = sampleint(2, 4, 2)
    lst_expr = [u*ln(p),
    -u*ln(p),
    ln(p) + ln(q),
    ln(p) - ln(q),
    u*ln(p) + ln(q),
    u*ln(p) - ln(q),
    u*ln(p) + v*ln(q),
    u*ln(p) - v*ln(q)]
    expr = lst_expr[c]
    return expr, simplify(E**expr)

prefixes = []
for i in range(n):
    expr, sol = generate(param['types'][i])
    prefixes.append(f"$! {latex(expr)} = !$")
    inputs[i].sol = sol
    inputs[i].set_embed(embed)

==

question ==
Ecrire les expressions suivantes sous la forme  $% \ln(a)%$, où $%a%$ est un nombre.
==

embed ==
\ln \left( # \right)
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






