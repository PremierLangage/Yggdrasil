# Author: D. Doyen
# Tags: complex numbers, square root
# Calculer les racines carrées d'un nombre complexe
# 19/7/2021

extends = /model/math/set.pl

wobracket = True

before ==
a=randint(1,6)
b=randint(-6,6,[0])
z=((a+b*I)**2).expand()
sol=[a+b*I,-a-b*I]
==

question ==
Calculer les racines carrées de $! {{z|latex}} !$ (sous forme algèbrique).  Séparer les deux racines par une virgule.
==

solution ==
Les racines carrées sont $! {{sol[0]|latex}} !$ et $! {{sol[0]|latex}} !$.
==











