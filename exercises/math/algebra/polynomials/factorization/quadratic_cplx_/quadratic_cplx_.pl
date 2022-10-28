# D. Doyen
# polynomials
# 19/8/2020

extends = /model/math/poly.pl

poly_form = "factorized"

poly_domain = C
symbol_dict = {'e': E, 'i': I}

before ==
from sympy import factor, content, solveset, S
x = Symbol('X')

q, r = sample([1, 2, 3, 4, 5], 2)
q = choice([-1,1])*q
r = choice([-1,1])*r
[b, a], [d, c] = sample([[1,2],[3,2],[5,2],[1,3],[2,3],[4,3],[5,3],[1,4],[3,4],[5,4],[1,5],[2,5],[3,5],[4,5]], k=2)
a=choice([-1,1])*a
c=choice([-1,1])*c

P = (x-q+r*I)*(x-q-r*I)


P = choice([-1,1])*choice([1 , 2])*P/content(P)

sol = factor(P)
expr = P.expand()
==

question ==
Factoriser le polynôme
$$P(x)= {{ expr|latex }}$$
$$ {{ P|latex }}$$
en remarquant que $! P( {{ x1 |latex }} )=0 !$.
==


solution ==
Une factorisation de cette expression est $! {{ sol|latex }} !$.
==

