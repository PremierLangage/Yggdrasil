extends = /model/math/expr.pl

title = Antécédent

before ==
v1, v2 = sorted(sample(['n', 'm', 'p', 'q'], 2))
a = Symbol(v1)
b = Symbol(v2)

lst = [2*a - b, a**2+b, b**2 + a, a*b, (a+1)*b, (a-1)*b]

expr = choice(lst)
f = Lambda((a, b), expr)

x1 = randint(-4, 4)
x2 = randint(-4, 4)
sol = f(x1, x2)
==

question ==
On considère la fonction $! f : \mathbb{Z} \times \mathbb{Z} \rightarrow \mathbb{Z} !$ telle que
$$f( {{ v1 }}, {{ v2 }})= {{ expr|latex }}$$
Déterminer $! f ( {{ x1 }}, {{ x2 }}) !$
==



solution ==
La solution est.
==
