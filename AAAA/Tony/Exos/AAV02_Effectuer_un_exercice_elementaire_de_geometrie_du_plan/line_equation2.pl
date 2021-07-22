extends = /model/math/expr.pl

before == 
var('x')
a =  [randint(0,5),randint(-5,5)]
b = [randint(-5,-1),randint(-5,5)]


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
