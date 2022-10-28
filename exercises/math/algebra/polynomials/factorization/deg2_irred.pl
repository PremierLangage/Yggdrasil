# D. Doyen
# polynomials, polynomial equation, quadratic equation, quadratic polynomials, roots
# Déterminer si une équation quadratique a des solutions.
# 31/5/22

extends = /model/math/checkbox.pl

title = Déterminer si une équation quadratique a des solutions

before ==
from sympy import Eq
var('x')
indsol = []
items = []
for i in range(4):
    a = randint(-3, 3, [0])
    b = randint(-5, 5)
    c = randint(-3, 3)
    if b**2-4*a*c < 0:
        indsol.append(i)
    P = a*x**2+b*x+c
    if randint(0, 1) == 1:
        P = P * (x - randint(-3, 3, [0])
    items.append(r"$! %s !$" % latex(P))
==

question ==
Sélectionner les polynômes qui ne sont pas sous forme factorisée (dans $! \mathbb{R} !$). 
==

