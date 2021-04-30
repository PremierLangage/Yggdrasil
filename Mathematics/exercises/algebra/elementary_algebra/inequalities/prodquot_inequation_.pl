# Author: D. Doyen
# Tags: inequalities
# 19/8/2020

extends = /model/math/interval.pl

title = Résoudre une inéquation produit/quotient

param.type = product

param.bounds = int

before ==
var('x')

ok=False
if param['bounds']=='int':
    b, d = sampleint(2, -6, 6, [0])
    P, Q = (x+b), (x+d)
if param['bounds']=='intrat':
    while not ok:
        b, d= [randint(-6, 6, [0]) for i in range(2)]
        a, c = [randint(-6, 6, [0, 1, -1]) for i in range(2)]
        if b*c!=d: ok=True
    P,Q=(x+b),(c*x+d)
if param['bounds']=='rat':
    while not ok:
        b, d = [randint(-6, 6, [0]) for i in range(2)]
        a, c = [randint(-6, 6, [0, 1, -1]) for i in range(2)]
        if b*c!=a*d: ok=True
    P,Q=(a*x+b),(c*x+d)

if param['type']=="product":
    expr=P*Q
elif param['type']=="quotient":
    expr=P/Q

ineq=randitem([expr>=0,expr>0,expr<=0,expr<0])
sol=solveset(ineq,x,domain=S.Reals)
==

input.virtualKeyboards = sets

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

evaluator==
score, error = eval_rset(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $% {{sol|latex}} %$.
==






