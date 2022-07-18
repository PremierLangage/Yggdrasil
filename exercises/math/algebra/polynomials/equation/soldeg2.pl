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
    sides = choice([[a*x**2+b*x+c,0],[a*x**2+b*x,-c],[a*x**2,-b*x-c],[a*x**2+c,-b*x]])
    shuffle(sides)
    items.append(r"$! %s !$" % latex(Eq(*sides)))
==

question ==
Sélectionner les équations qui n'ont pas de solution réelle dans la liste ci-dessous.
==


