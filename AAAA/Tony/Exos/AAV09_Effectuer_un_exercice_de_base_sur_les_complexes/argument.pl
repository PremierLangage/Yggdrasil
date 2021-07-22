# Author: D. Doyen
# Tags: complex numbers
# 19/8/2020
#Etat : à débugguer
extends = /model/math/input.pl

title = Argument d'un nombre complexe

before ==
z=randItem([I,-I,1,-1,1+I,1-I,I-1,-1-I])
z=randint(1,3)*z
sol=arg(z)
==

text = Déterminer un argument du nombre complexe $% z= {{ z|latex }} %$.

evaluator==
score, error = eval_expr(input.value,sol,modulo=2*pi)
feedback = message[error]
==

solution==
Un argument de $! z !$ est $% \displaystyle {{ sol|latex }} %$.
==



