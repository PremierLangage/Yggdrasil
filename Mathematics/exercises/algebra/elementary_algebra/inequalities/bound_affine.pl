# Author: D. Doyen
# Tags: inequalities
# Encadrer ax+b
# 19/8/2020

extends = /model/math/chainineq.pl

before ==
var('x')
a=randint(-3,3,[0])
b=randint(-8,8,[0])
x1, x2 = sorted(sampleint(-8, 8, 2))
s1, s2 = choices(['<','<='], k=2)

if a>0:
    elem = [a*x1+b, s1, s2, a*x2+b]
else:
    elem = [a*x2+b, s2, s1, a*x1+b]

sol = Interval(elem[0], elem[3])
if elem[1] == '<':
    sol.left_open = True
if elem[2] == '<':
    sol.left_open = True  

ineq = " ".join(latex([x1, s1, x, s2, x2]))
expr = a*x+b
==


question ==
Soit un nombre $% x %$ tel que $% {{ineq}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr|latex}} %$.
==