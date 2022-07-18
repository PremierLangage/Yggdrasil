# D. Doyen
# 17/3/2022
# inequalities
# Résoudre un système d'inéquations linéaires

extends = /model/math/interval.pl

title = Système d'inéquations linéaires

# Paramètres

param.otherside1 = "zero"

param.otherside2 = "zero"

param.nonempty = True

# Autres clés

before == #|py|
from sympy import S, solveset, Intersection, EmptySet

var('x')
a = randint(-6, 6, [-1, 0, 1])
b = randint(-6, 6, [0])
c = randint(-6, 6, [-1, 0, 1, a])
d = randint(-6, 6, [0, b])
f = a*x + b

if param['otherside1'] == 'zero':
    g = 0
elif param['otherside1'] == 'cst':
    g = d
elif param['otherside1'] == 'aff':
    g = c*x + d
else:
    raise ValueError("Incorrect value for parameter otherside1.")

ineq1 = choice([f>=g, f>g, f<=g, f<g, g>=f, g>f, g<=f, g<f])
sol1 = solveset(ineq1, x, domain=S.Reals)

while True:
    var('x')
    a = randint(-6, 6, [-1, 0, 1])
    b = randint(-6, 6, [0])
    c = randint(-6, 6, [-1, 0, 1, a])
    d = randint(-6, 6, [0, b])
    f = a*x + b

    if param['otherside2'] == 'zero':
        g = 0
    elif param['otherside2'] == 'cst':
        g = d
    elif param['otherside2'] == 'aff':
        g = c*x + d
    else:
        raise ValueError("Incorrect value for parameter otherside.")

    ineq2 = choice([f>=g, f>g, f<=g, f<g, g>=f, g>f, g<=f, g<f])
    sol2 = solveset(ineq2, x, domain=S.Reals)
    sol = Intersection(sol1, sol2)
    if param['nonempty']:
        if sol != EmptySet:
            break
    else:
        break


if param['nonempty']:
    keypad = ["+infty", "-infty"]
    qstr = "Ecrire cet ensemble sous la forme d'un intervalle."
else:
    keypad = ["+infty", "-infty", "empty"]
    qstr = "Ecrire cet ensemble sous la forme d'un intervalle (ou de l'ensemble vide)."
==

question ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ ineq1|latex }}\quad\text{ et }\quad{{ ineq2|latex }}. $$ {{ qstr }}.
==