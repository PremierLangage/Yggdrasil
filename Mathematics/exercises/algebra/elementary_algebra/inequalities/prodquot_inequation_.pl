# Author: D. Doyen
# Tags: inequalities
# 19/8/2020

extends = /model/math/interval.pl

param.type = product

param.bounds = int

before ==
from sympy import S, solveset

var('x')

ok=False
if param['bounds'] == 'int':
    b, d = sampleint(-6, 6, 2, [0])
    P, Q = (x+b), (x+d)
if param['bounds']=='intrat':
    while not ok:
        b, d = [randint(-6, 6, [0]) for i in range(2)]
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

ineq = choice([expr >= 0, expr > 0, expr <= 0, expr < 0])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==