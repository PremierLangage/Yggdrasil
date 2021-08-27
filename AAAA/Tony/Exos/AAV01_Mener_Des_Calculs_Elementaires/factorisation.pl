#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat = OK
extends = /model/math/poly.pl

title =  Savoir simplifier des expressions (développement, factorisation, identités remarquables, fractions…) - factorisation


before ==
from sympy import factor
x = Symbol('x')
a,b,c,d = sample([-3,-2,-1,1,2,3],4)
P = (a*x+b)**2-(c*x+d)**2
Q = (a*x+b)**2-c*a*x-c*b
R = choice([P,Q])
sol = factor(R)
==

question ==
Factoriser l'expression suivante :
$$ {{ R|latex }}. $$
==

poly_form = "factorized"

