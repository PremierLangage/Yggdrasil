# D. Doyen
# 7/3/2021
# complex numbers, modulus, argument
# Déterminer un argument d'un nombre complexe

extends = /model/math/multimathinput.pl

title = Division euclidienne

param.genP = "Poly(randpoly(3, 3, 4, X), X)"
param.genQ = "Poly(X + randint(-3, 3))"

before ==
from randsympy import randpoly
from sympy.polys.polytools import quo, rem
var('X')
P = eval(param['genP'])
Q = eval(param['genQ'])

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
