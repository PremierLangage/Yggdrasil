# D. Doyen
# 7/3/2021
# complex numbers, exponential form, cartesian form
# Passer d'une forme exponentielle à une forme cartésienne

extends = /model/math/complex.pl

complex_form = "Cartesian"

title = Forme exponentielle vers cartésienne

before == #|py|
from sympy import evaluate
# Définition un peu compliquée du nombre complexe
# pour éviter les simplifications automatiques faites par SymPy
# ex : exp(I*pi/2) -> i
m = randint(-2, 2, [0]) * E
a = I * choice([pi/4, pi/2, -pi/4, -pi/2, 3*pi/4, 3*pi/2])
sol = (m**a).expand()
==

question == 
Ecrire sous forme cartésienne le nombre complexe $! \displaystyle \large z =  {{ m|latex }}^{  {{ a|latex }} } !$.
==