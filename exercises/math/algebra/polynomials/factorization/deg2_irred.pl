# D. Doyen
# polynomials, polynomial equation, quadratic equation, quadratic polynomials, roots
# Déterminer si une équation quadratique a des solutions.
# 31/5/22

extends = /model/math/checkbox.pl

title = Polynômes irréductibles dans R

before ==
from sympy import Eq
x = Symbol('X')
indsol = []
items = []
for i in range(4):
    a = randint(-3, 3, [0])
    b = randint(-5, 5)
    c = randint(-3, 3)
    if b**2-4*a*c < 0:
        indsol.append(i)
    P = a*x**2+b*x+c
    items.append(r"$! %s !$" % latex(P))
==

question ==
Sélectionner les polynômes qui sont irréductibles dans $! \mathbb{R} !$ (c'est-à-dire qui ne sont pas factorisables dans $! \mathbb{R} !$). 
==

