# Author: D. Doyen
# Tags: inequalities
# 19/8/2020

extends = /model/mathinput.pl

title = Encadrement de $% a x + b %$


before ==
var('x')
a=randint(-3,3,[0])
b=randint(-8,8,[0])
x1,x2=sorted(list_randint_norep(2,-8,8))
s1,s2=list_randitem(2,['<','<='])

if a>0:
    sol=[a*x1+b,s1,a*x+b,s2,a*x2+b]
else:
    sol=[a*x2+b,s2,a*x+b,s1,a*x1+b]

ineq = [x1,s1,x,s2,x2]
expr = latex(a*x+b)
input.value = expr
==

input.virtualKeyboards = relations

text ==
Soit un nombre $% x %$ tel que $%{{ineq}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr}} %$.
==

evaluator==
score, error = eval_chainineq(input.value,sol)
feedback = feeadback_message[error]
==








