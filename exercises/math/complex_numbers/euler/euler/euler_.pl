# D. Doyen

extends = /model/math/multimathinput.pl

title = Calculer module et argument

before ==
from sympy import arg

a, b = 0, 0
while a + b == 0:
    a = pi*choice([-1, 1]) * sympify(choice(['1/4', '3/4', '1/3', '2/3']))
    b = pi*choice([-1, 1]) * sympify(choice(['1/4', '3/4', '1/3', '2/3']))

z =  exp(I*a) + exp(I*b)

prefixes = []
inputs = [MathInput(type="expr"), MathInput(type="expr", evalparam={'equality': "", 'modulo': 2*pi})]

prefixes.append("module :")
inputs[0].sol =  abs(2*cos((a-b)/2))

prefixes.append("argument :")
inputs[1].sol =  (a+b)/2
==

question ==
Déterminer le module et un argument du nombre complexe $! z= {{ z|latex }} !$.
==
