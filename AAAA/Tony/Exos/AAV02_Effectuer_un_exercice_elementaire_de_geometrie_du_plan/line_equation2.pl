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
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img img-60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==
