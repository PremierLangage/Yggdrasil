#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat = marche. Voir pour enelver les racines nulles et rajouter un coefficient devant ? 
extends = /model/math/poly.pl

title = Savoir résoudre une équation du second degré

before ==
x = Symbol('x')
P = x + randint(-3, 3,[0])
Q = x + randint(-3, 3,[0])
sol = P * Q
expr = sol.expand()
==

question ==
Factoriser l'expression suivante :
$$ {{ expr|latex }}. $$
==

poly_form = "factorized"
