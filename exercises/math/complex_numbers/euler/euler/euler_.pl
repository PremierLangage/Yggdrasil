# D. Doyen

extends = /model/math/multimathinput.pl

title = Calculer module et argument

before ==
from sympy import arg

theta1, theta2 = 0, 0
while theta1+theta2 == 0:
    theta1 = pi * choice([-1, 1]) * choice([1/4, 3/4, 1/3, 2/3, 4/3, 1/6, 5/6])
    theta2 = pi * choice([-1, 1]) * choice([1/4, 3/4, 1/3, 2/3, 4/3, 1/6, 5/6])

z = exp(I*theta1) + exp(I*theta2)

prefixes = []
inputs = [MathInput(type="expr"), MathInput(type="expr", evalparam={'equality': "", 'modulo': 2*pi})]

prefixes.append("module :")
inputs[0].sol =  abs(z)

prefixes.append("argument :")
inputs[1].sol =  arg(z)
==

question ==
Déterminer le module et un argument du nombre complexe $! z= {{ z|latex }} !$.
==
