# D. Doyen
# 7/3/2021
# complex numbers, modulus, argument
# Déterminer un argument d'un nombre complexe

extends = /model/math/multimathinput.pl

title = Division euclidienne

param.z0 = "I, -I, 1, -1, 1+I, 1-I, I-1, -1-I"
param.coeff = "1, 2, 3, 1/2, 1/3, sqrt(2), sqrt(3)"

before ==
prefixes = []
inputs = [MathInput(type="poly"), MathInput(type="poly")]

prefixes.append("quotien :")
inputs[0].sol =  abs(z)

prefixes.append("rest :")
inputs[1].sol =  arg(z)
==

question ==
Déterminer le module et un argument du nombre complexe $! z= {{ z|latex }} !$.
==
