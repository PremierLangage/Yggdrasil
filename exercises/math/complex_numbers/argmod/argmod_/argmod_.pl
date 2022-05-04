# D. Doyen
# 7/3/2021
# complex numbers, modulus, argument
# Déterminer un argument d'un nombre complexe

extends = /model/math/multimathinput.pl

title = "Argument d'un nombre complexe"

before ==
from sympy import arg

modulus = choice([I,-I,1,-1,1+I,1-I,I-1,-1-I])
argument = choice

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