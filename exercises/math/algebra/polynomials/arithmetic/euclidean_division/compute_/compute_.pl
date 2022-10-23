# D. Doyen
# 7/3/2021
# complex numbers, modulus, argument
# Déterminer un argument d'un nombre complexe

extends = /model/math/multimathinput.pl

title = Division euclidienne

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
