# D. Doyen
# 7/3/2021
# complex numbers, modulus, argument
# Déterminer un argument d'un nombre complexe

extends = /model/math/multimathinput.pl

title = Division euclidienne

param.z0 = "I, -I, 1, -1, 1+I, 1-I, I-1, -1-I"
param.coeff = "1, 2, 3, 1/2, 1/3, sqrt(2), sqrt(3)"

before ==
from randsympy import randpoly
from sympy.polys.polytools import quo, rem
var('X')
P = Poly(randpoly(3, randint(2,3), 5, X), X)
Q = Poly(randpoly(1, 2, 5, X), X)

prefixes = []
inputs = [MathInput(type="poly"), MathInput(type="poly")]

prefixes.append("quotient :")
inputs[0].sol =  quo(P, Q)

prefixes.append("reste :")
inputs[1].sol =  rem(P, Q)
==

question ==
Effectuer la division euclidienne du polynôme $! {{ P|latex }} !$ par le poynôme $! {{ Q|latex }} !$ .
==
