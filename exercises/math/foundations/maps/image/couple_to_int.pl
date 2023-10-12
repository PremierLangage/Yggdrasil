extends = /model/math/expr.pl

title = Antécédent

before ==
v1, v2 = sorted(sample(['n', 'm', 'p', 'q'], 2))
x = Symbol(v1)
y = Symbol(v2)

a, b = sample([x, y], 2)
c1, c2 = sample([1, randint(2, 3)], 2)
c3 = choice([-3, -2, 2, 3])
c4 = randint(-2, 2, [0])
s = choice([-1, 1])
lst = [c1*a + s*c2*b, c1*a**2 + s*c2*b, c3*a*(b+c4), c3*a*(b**2+c4), c3*a**2*(b+c4)]

expr = choice(lst)
f = Lambda((x, y), expr)

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
