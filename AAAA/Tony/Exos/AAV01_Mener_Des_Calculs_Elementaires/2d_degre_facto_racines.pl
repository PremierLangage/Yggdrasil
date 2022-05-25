#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat = OK
extends = /model/math/poly.pl

title = Savoir résoudre une équation du second degré

before ==
x = Symbol('x')
P = x + randint(-3, 3,[0])
Q = x + randint(-3, 3,[0])
sol = randint(-2, 2,[0]) * P * Q
expr = sol.expand()

from sympy import Matrix
A = Matrix([[-1,2],[3,-2]]) 
==

question ==
Factoriser l'expression suivante :
$$ {{ expr|latex }}. $$  $${{A|latex}}$$
==

poly_form = "factorized"
