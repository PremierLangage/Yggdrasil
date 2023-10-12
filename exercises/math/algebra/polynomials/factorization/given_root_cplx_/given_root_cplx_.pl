# D. Doyen
# polynomials
# 19/8/2020

extends = /model/math/multimathinput.pl

title = Factorisation (racine donnée)

before ==
from sympy import factor, content, solveset, S
x = Symbol('X')

q, r = sample([1, 2, 3, 4, 5], 2)
x1, x2 = sample([1, 2, -1, -2], 2)
q = choice([-1,1])*q
r = choice([-1,1])*r
[b, a], [d, c] = sample([[1,2],[3,2],[5,2],[1,3],[2,3],[4,3],[5,3],[1,4],[3,4],[5,4],[1,5],[2,5],[3,5],[4,5]], k=2)
a=choice([-1,1])*a
c=choice([-1,1])*c

Q1 = (x-q+r*I)*(x-q-r*I)
Q2 = Q1.expand()
coeff = choice([-1,1])*choice([1 , 2])
solC = factor(coeff*(x-x1)*Q1)
solR = factor(coeff*(x-x1)*Q2)

expr = solR.expand()

prefixes = []
inputs = [MathInput(type="poly", evalparam = {'var': "X", 'form': "factorized", 'domain': "C"}), MathInput(type="poly", evalparam = {'var': "X", 'form': "factorized", 'domain': "R"})]

prefixes.append("factorisation dans $! \mathbb{C} !$ :")
inputs[0].sol =  solC

prefixes.append("factorisation dans $! \mathbb{R} !$ :")
inputs[1].sol =  solR
==

question ==
Factoriser dans $! \mathbb{C} !$ et dans $! \mathbb{R} !$  le polynôme
$$P(X)= {{ expr|latex }}$$
en remarquant que $! {{x1|latex}} !$ est une racine du polynôme.
==
