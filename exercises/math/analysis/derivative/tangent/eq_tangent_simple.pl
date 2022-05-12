extends = /model/math/expr.pl

title = Déterminer l'équation d'une tangente

before ==
var('x')
a = choice([1, 2, Rational(1, 2), Rational(1, 3)])
b = choice([1, 2, 3, 4)
f = choice([a*x**3+b*x, a*x**3+b*x**2 ])
x0 = randint(-2, 2)

==

question ==
Soit la fonction $! f: x \mapsto {{ f }} !$. Déterminer l'équation de la tangente à la courbe représentative de $! f !$ au point d'abscisse $! {{ x0 }} !$.
==

prefix ==
$! y = !$
==
