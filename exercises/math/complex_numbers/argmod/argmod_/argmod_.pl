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

from sympy import conjugate
from sympy2latex import latex_lincomb

n = 5
z1 = randint(-n, n, [0]) + randint(-n, n, [0])*I
z2 = randint(-n, n, [0]) + randint(-n, n, [0])*I
while z1 == z2:
    z2 = randint(-n, n, [0]) + randint(-n, n, [0])*I

#z1b = conjugate(z1)
#z2b = conjugate(z2)

prefixes = []
inputs = []

inputs = [MathInput(type="expr"), MathInput(type="expr")]
prefixes.append("module :")
inputs

prefixes.append(f"$! z_1 - z_2 = !$")
sols.append((z1 - z2).expand())


z = choice([I,-I,1,-1,1+I,1-I,I-1,-1-I])
z = randint(1, 3)*z
sol = arg(z)
==

question ==
Déterminer le module et un argument du nombre complexe $! z= {{ z|latex }} !$.
==
