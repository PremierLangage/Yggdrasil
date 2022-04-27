extends = /model/math/expr.pl

title = Calcul de primitive

question ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{ f|latex }} .$$
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{ sol|latex }} + k $$

où $ k $ est une constante réelle.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.

before ==
from sympy import integrate
var('x')
alpha = choice ([Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4])
a = 1

lst_vx = [exp(x),
sin(x),
cos(x)]
vx = choice(lst_vx)
v = Lambda(x, vx)

u = x

f = alpha*diff(u, x)*v(u)


sol = integrate(f, x).doit()
==
