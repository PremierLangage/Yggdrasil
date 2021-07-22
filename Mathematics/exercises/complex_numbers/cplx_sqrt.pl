# Author: D. Doyen
# Tags: complex numbers, square root
# Calculer les racines carrées d'un nombre complexe
# 19/7/2021

extends = /model/math/set.pl

param.roots = int

wobracket = True

before ==
a=randint(1,6)
b=randint(-6,6,[0])
z=((a+b*I)**2).expand()
z_tex=latex(z)
sol=[a+b*I,-a-b*I]
sol0_tex=latex(sol[0])
sol1_tex=latex(sol[1])
==

question ==
Calculer les racines carrées de $! {{z_tex}} !$ (sous forme algèbrique).  Séparer les deux racines par une virgule.
==

solution ==
Les racines carrées sont $! {{sol0_tex}} !$ et $! {{sol1_tex}} !$.
==











