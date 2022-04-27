extends = /model/math/expr.pl

title = Calcul de primitive

param.form = [0, 1, 2]
param.u = [0, 1, 2]

# Paramètres
# 0 : e^x
# 1 : sin(x)
# 2 : cos(x)
# 3 : e^(ax)
# 4 : sin(ax)
# 5 : cos(ax)
# 6 : x^n
# 7 : 1/x
# 8 : 1/x^2
# 9 : 1/x^n
# 10 : sqrt(x)
# 11 : 1/sqrt(x)
# 12 : x^r

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
lst_a = [Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4])
r = Rational(3, 2)

lst_vx = [exp(x),
sin(x),
cos(x),
exp(choice(lst_a)*x),
sin(choice(lst_a)*x),
cos(choice(lst_a)*x),
x**randint(3, 7),
1/x,
1/x**2,
1/x**randint(3, 7),
sqrt(x),
1/sqrt(x),
x**r]

iterms = sample([0, 1, 2, 6, 7, 8], 2)
f = 0
for i in iterms:
    f += lst_vx[i]

sol = integrate(f, x).doit()
==
