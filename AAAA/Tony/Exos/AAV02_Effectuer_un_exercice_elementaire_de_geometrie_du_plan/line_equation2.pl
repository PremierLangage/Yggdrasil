extends = /model/math/expr.pl

before == 
var('x')
p =  [randint(0,5),randint(-5,5)]
q = [randint(-5,-1),randint(-5,5)]
a = (q[1]-q[0])/(p[1]-p[0])
b = q[1]-a*q[0]
sol = a*x + b 
==

question ==
Déterminer l'équation de la droite passant par les points $!(p[0],p[1])!$ et $!(q[0],q[1])!$ (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
==

prefix ==
$! y = !$
==
