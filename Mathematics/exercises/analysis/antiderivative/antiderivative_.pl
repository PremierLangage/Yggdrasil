extends = /model/math/expr.pl

title = Calcul de primitive

question ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{ f|latex }} .$$
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{ sol|latex }} + k $$
où $! k !$ est une constante réelle.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.

before ==
from sympy import integrate
x = Symbol('x')
c = choice ([Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4])
if randint(0, 1) == 1:
    a = c
    b = 1
else:
    a = 1
    b = c
i = randint(0, 2)
u = [exp(a*x), sin(a*x), cos(a*x)][i]
du = [exp(a*x), cos(a*x), sin(a*x)][i]
g = choice([exp, sin, cos])
f = b*du*g(u)
sol = integrate(f, x).doit()
==