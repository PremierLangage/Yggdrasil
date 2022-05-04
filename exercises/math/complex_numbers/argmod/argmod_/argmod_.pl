# D. Doyen
# 7/3/2021
# complex numbers, modulus
# Déterminer un argument d'un nombre complexe

extends = /model/math/multimathinput.pl

equality = "Modulo"

modulo = 2*pi

title = "Argument d'un nombre complexe"

before ==
from sympy import arg

z = choice([I,-I,1,-1,1+I,1-I,I-1,-1-I])
z = randint(1, 3)*z

prefixes = []
inputs = [MathInput(type="expr"), MathInput(type="expr", evalparam={'equality': "Modulo", 'modulo': 1})]

prefixes.append("module :")
inputs[0].sol =  abs(z)

prefixes.append("argument :")
inputs[1].sol =  arg(z)
==

question ==
Déterminer le module et un argument du nombre complexe $! z= {{ z|latex }} !$.
==
