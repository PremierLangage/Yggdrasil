# D. Doyen
# 7/3/2021
# complex numbers, modulus
# Calculer le module d'un nombre complexe (sous forme cartésienne) 

extends = /model/math/complex.pl

complex_form = "Cartesian"

title = "Forme exponentielle vers cartésienne"

before ==
from sympy import evaluate
a = randint(1,3)
z = a*exp(I*pi/4)
sol = z.expand()
==

question == 
Ecrire sous forme cartésienne le nombre complexe $! \displaystyle z = {{ z|latex }} !$.
==