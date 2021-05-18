# Author: D. Doyen
# Tags: inequalities
# 19/8/2020

extends = /model/math/input.pl

title = Encadrement de $% a x + b %$


before ==
var('x')
a=randint(-3,3,[0])
b=randint(-8,8,[0])
x1, x2 = sorted(sampleint(-8, 8, 2))
#s1, s2 = choices(['<','<='], k=2)

if a>0:
    sol=[a*x1+b, s1, a*x+b, s2, a*x2+b]
else:
    sol=[a*x2+b, s2, a*x+b, s1, a*x1+b]

#ineq = latex_ineq([x1,s1,x,s2,x2])
expr = latex(a*x+b)
==


text ==
Soit un nombre $% x %$ tel que $%{{ineq}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr}} %$.
==