# Author: D. Doyen
# Tags: complex numbers
# 19/8/2020

extends = /model/math/expr.pl

equality = "Modulo"

modulo = 2*pi

title = Argument d'un nombre complexe

before ==
from sympy import arg
z = choice([I,-I,1,-1,1+I,1-I,I-1,-1-I])
z = randint(1, 3)*z
sol = arg(z)
==

question ==
Déterminer un argument du nombre complexe $! z= {{ z|latex }} !$.
==