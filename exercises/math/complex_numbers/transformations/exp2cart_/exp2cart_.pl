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
m = choice(sympify(param['mod']))
a = I * choice(sympify(param['arg']))
sol = (m*E**a).expand(complex = True).simplify()
==

question == 
Ecrire sous forme cartésienne le nombre complexe $! \displaystyle z =  {{ m|latex }} e^{  {{ a|latex }} } !$.
==