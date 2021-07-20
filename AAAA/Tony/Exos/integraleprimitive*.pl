#Calcul de primitives.
extends = /model/math/expr.pl

#A réglier : sympy n'a pas l'éair  de prendre ln(abs(x)). Pb lié à la valeur absolue.

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')
ch = randint(0,7)
d1,d2,d3 = randint(-5,5),randint(-5,5),randint(-5,5)
al = randint(1,6)
n= randint(1,6)

g = choice([sin(k*x),cos(k*x),x**k, exp(k*x), d1*x**2+d2*x+d3, x*exp(k*x^2),  x*cos(k*x^2),  x*sin(k*x^2), diff(d1*x**2+d2*x+d3)/(d1*x**2+d2*x+d3)])


if ch == 0: 
    f = al*dg*sin(g)
elif ch == 1:
    f = al*dg*cos(g)
elif ch == 2:
    f = al*dg*exp(g)
elif ch == 3:
    f =al*dg/g
elif ch == 4:
    f = al*dg*g**n
elif ch == 5:
    f = d1*x**2+d2*x+d3
else:
    f = al*dg/g**n

sol = integrate(f, x) 
==

#Type d'intégrale : pol d'ordre 2, fonction d'un multiple de x^2 ou x, u'/u avec u fonction classique


question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$.

Attention,il ne faut pas utiliser la notation $!C!$. 
Si vous voulez ajouter une constante à votre fonction, il faut donner un réel.
==

  


