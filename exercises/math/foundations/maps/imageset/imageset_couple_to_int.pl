extends = /model/math/set.pl

before ==
n, m = sample(symbols("n,m,p,q,r"), 2)
expr = choice([n**2+m, n+m**2, n**2-m, n-m**2])
f = Lambda((n ,m), expr)

E = [(x, y) for x in range(-3,4) for y in range(-3,4)]
A = FiniteSet(*sample(E, 2))
sol = FiniteSet(*[f(*x) for x in A])
==

question ==
On considère la fonction $! f : \mathbb{Z} \times \mathbb{Z} \rightarrow \mathbb{Z} !$ telle que
$$ f({{ n }}, {{ m }})= {{ expr|latex }} $$
Déterminer $! f( {{ A|latex }}). !$
==