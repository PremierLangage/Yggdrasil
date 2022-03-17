# D. Doyen
# 17/3/2022
# inequalities
# Résoudre une inéquation produit ou quotient

extends = /model/math/interval.pl

# Paramètres

param.type = "product"

param.bounds = "int"

# Autres clés

before == #|py|
from sympy import S, solveset

var('x')

if param['bounds'] == 'int':
    b, d = sampleint(-6, 6, 2, [0])
    P, Q = (x+b), (x+d)
elif param['bounds'] == 'intrat':
    while True:
        b, d = [randint(-6, 6, [0]) for i in range(2)]
        a, c = [randint(-6, 6, [0, 1, -1]) for i in range(2)]
        if b*c != d:
            break
    P, Q = (x+b), (c*x+d)
elif param['bounds'] =='rat':
    while True:
        b, d = [randint(-6, 6, [0]) for i in range(2)]
        a, c = [randint(-6, 6, [0, 1, -1]) for i in range(2)]
        if b*c != a*d:
            break
    P, Q = (a*x+b), (c*x+d)

if param['type'] == "prod":
    expr = P*Q
elif param['type']=="quot":
    expr = P/Q

ineq = choice([expr >= 0, expr > 0, expr <= 0, expr < 0])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

keypad = ["+infty", "-infty", "cup"]