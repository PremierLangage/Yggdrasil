extends = /model/math/expr.pl

title = Calcul de primitive

# Paramètres
# 0 : \alpha\ u'e^u
# 1 : \alpha\ u' sin(u)
# 2 : \alpha\ u' cos(u)
# 3 : \alpha\ \frac{u'}{u}
# 4 : \alpha\ u'u
# 5 : \alpha\ u'u^2
# 6 : \alpha\ u'u^n (n\geq 3)
# 7 : \alpha\ \frac{u'}{u^2}
# 8 : \alpha\ \frac{u'}{u^n} (n\geq 3)
# 9 : \alpha\ \frac{u'}{\sqrt{u}}
# 10 : \alpha\ u' \sqrt{u}
\(\alpha\ \frac{u'}{\sqrt{u}}\)
\(\alpha\ u' u^r\) \((r\in \mathbb{Q})\)

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
