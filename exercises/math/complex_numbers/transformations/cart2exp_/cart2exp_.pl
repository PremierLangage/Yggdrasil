# D. Doyen
# 7/3/2021
# complex numbers, exponential form, cartesian form
# Passer d'une forme cartésienne à une forme exponentielle 

extends = /model/math/complex.pl

complex_form = "Exponential"

title = Forme cartésienne vers exponentielle

param.z0 = "I, -I, -1, 1+I, 1-I, I-1, -1-I"
param.coeff = "1, 2, 3, 1/2, 1/3, sqrt(2), sqrt(3)"

before == #|py|
from sympy import arg
z = choice(sympify(param['coeff']))*choice(sympify(param['z0']))
sol = abs(z)*exp(I*arg(z))
==

question == 
Ecrire sous forme exponentielle le nombre complexe $! \large {{z|latex}} !$.
==