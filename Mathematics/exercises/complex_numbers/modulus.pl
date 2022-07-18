# Author: D. Doyen
# Tags: complex numbers
# 19/8/2020

extends = /model/mathquill.pl

title = Module d'un nombre complexe

before ==
a=randitem([-1,1])*randitem([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])
b=randitem([-1,1])*randitem([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])

z=a+b*I
sol=abs(z)
==

text ==
Déterminer le module du nombre complexe $% z= {{ z|latex }} %$.
==

solution==
Le module de $! z !$ est $% \displaystyle {{ sol|latex }} %$.
==





