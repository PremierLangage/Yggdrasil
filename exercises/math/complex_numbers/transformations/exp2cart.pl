# D. Doyen
# 7/3/2021
# complex numbers, modulus
# Calculer le module d'un nombre complexe (sous forme cartésienne) 

extends = /model/math/complex.pl

complex_form = "Cartesian"

title = "Forme exponentielle vers cartésienne"

before ==
from sympy import evaluate
m = randint(1, 3)
a = choice([pi/4, pi/2, -pi/4, -pi/2, 3*pi/4, 3*pi/2])
z = m*exp(a*I)
sol = z.expand()
==

question == 
Ecrire sous forme cartésienne le nombre complexe $! \displaystyle z = {{ m*exp(a*I)|latex }} !$.
==