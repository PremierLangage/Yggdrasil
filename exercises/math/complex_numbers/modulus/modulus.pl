# Author: D. Doyen
# Tags: complex numbers
# 19/8/2020

extends = /model/math/expr.pl

title = Module d'un nombre complexe

before ==
a = choice([-1,1])*choice([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])
b = choice([-1,1])*choice([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])

z = a+b*I
sol = abs(z)
==

question ==
Déterminer le module du nombre complexe $! z= {{ z|latex }} !$.
==