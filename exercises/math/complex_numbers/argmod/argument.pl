# D. Doyen
# 7/3/2021
# complex numbers, modulus
# Déterminer un argument d'un nombre complexe

extends = /model/math/expr.pl

equality = "Modulo"

modulo = 2*pi

title = "Argument d'un nombre complexe"

before ==
from sympy import arg
z = choice([I,-I,1,-1,1+I,1-I,I-1,-1-I])
z = randint(1, 3)*z
sol = arg(z)
==

question ==
Déterminer un argument du nombre complexe $! z= {{ z|latex }} !$.
==