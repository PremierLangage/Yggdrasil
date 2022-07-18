# D. Doyen
# derivative, tangent
# Déterminer l’équation de la tangente en un point à la courbe représentative d’une fonction.
# 1/6/2022

extends = /model/math/expr.pl

title = Déterminer l'équation d'une tangente

before ==
var('x')
a = choice([-1, 1]) * choice([1, 2, Rational(1, 2), Rational(1, 3)])
b = choice([-1, 1]) *  choice([1, 2, 3, 4])
f = choice([a*x**3+b*x, a*x**3+b*x**2 ])
x0 = randint(-2, 2)
dfx0 = diff(f, x).subs(x, x0)
sol = simplify(f.subs(x, x0) + dfx0*(x-x0))
==

question ==
Soit la fonction $! \displaystyle f: x \mapsto {{ f|latex }} !$. Déterminer l'équation de la tangente à la courbe représentative de $! f !$ au point d'abscisse $! {{ x0 }} !$.
==

prefix ==
$! y = !$
==
