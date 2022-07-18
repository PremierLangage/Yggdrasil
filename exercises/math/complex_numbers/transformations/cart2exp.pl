# D. Doyen
# 7/3/2021
# complex numbers, exponential form, cartesian form
# Passer d'une forme cartésienne à une forme exponentielle 

extends = /model/math/complex.pl

complex_form = "Exponential"

title = "Forme cartésienne vers exponentielle"

before == #|py|
from sympy import arg
z = choice([I,-I,1,-1,1+I,1-I,I-1,-1-I])
z = randint(1, 3)*z
sol = abs(z)*exp(I*arg(z))
==

question == 
Ecrire sous forme exponentielle le nombre complexe $! \large {{z|latex}} !$.
==