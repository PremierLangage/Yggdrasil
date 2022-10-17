# D. Doyen

extends = /model/math/multimathinput.pl

title = Calculer module et argument

before ==
from sympy import arg

theta1, theta2 = 0, 0
while theta1+theta2 == 0:
    theta1 = pi * choice([-1, 1]) * sympify(choice(['1/4', '3/4', '1/3', '2/3', '4/3', '1/6', '5/6']))
    theta2 = pi * choice([-1, 1]) * sympify(choice(['1/4', '3/4', '1/3', '2/3', '4/3', '1/6', '5/6']))

z = 1 + exp(I*pi/4)

prefixes = []
inputs = [MathInput(type="expr"), MathInput(type="expr", evalparam={'equality': "", 'modulo': 2*pi})]

prefixes.append("module :")
inputs[0].sol =  abs(z.expand())

prefixes.append("argument :")
inputs[1].sol =  arg(z.expand())
==

question ==
Déterminer le module et un argument du nombre complexe $! z= {{ z|latex }} !$.
==
