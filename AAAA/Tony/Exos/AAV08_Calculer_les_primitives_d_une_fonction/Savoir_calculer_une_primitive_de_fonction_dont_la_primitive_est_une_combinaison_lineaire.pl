#Calcul de primitives.
extends = /model/math/expr.pl

#A réglier : sympy n'a pas l'éair  de prendre ln(abs(x)). Pb lié à la valeur absolue.
title = Savoir calculer une primitive de fonction dont la primitive est une combinaison linéaire ou une composition de fonctions usuelles

before ==
from sympy import integrate,diff
from random import choice, randint

x = Symbol('x') 
d1,d2,d3 = randint(-5,5),randint(-5,5),randint(-5,5)
a,n  = randint(1,6), randint(1,6) 
g = choice([sin(x),cos(x),x**n,ln(x), exp(x), d1*x**2+d2*x+d3])
dg = diff(g)
f = choice([a*dg*sin(g),a*dg*cos(g),a*dg*exp(g),a*dg/g,a*dg*g**n,d1*x**2+d2*x+d3,a*dg/g**n])

sol = integrate(f, x) 
==

question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$.

Attention,il ne faut pas utiliser la notation $!C!$. 
Si vous voulez ajouter une constante à votre fonction, il faut donner un réel.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.

keypad = ["sqrt"]

