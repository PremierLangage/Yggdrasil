extends = /model/math/expr.pl

title = Calcul de primitive

param.form = [0, 1, 2]
param.u = [0, 1, 2]

# Paramètres
# 0 : \alpha\ u' e^u
# 1 : \alpha\ u' sin(u)
# 2 : \alpha\ u' cos(u)
# 3 : \alpha\ \frac{u'}{u}
# 4 : \alpha\ u'u
# 5 : \alpha\ u'u^2
# 6 : \alpha\ u'u^n (n\geq 3)
# 7 : \alpha\ \frac{u'}{u^2}
# 8 : \alpha\ \frac{u'}{u^n} (n\geq 3)
# 9 : \alpha\ \frac{u'}{\sqrt{u}}
# 10 : \alpha\ u' u^r\) \((r\in \mathbb{Q})
# 11 : \alpha\ u' \sqrt{u}

# Paramètres
# 0 : a x
# 1 : a x^2
# 2 : a x + b
# 3 : a x^2 + b
# 4 : a x^2 + b x
# 5 : a x^n
# 6 : a sin(x)
# 7 : a cos(x)
# 8 : a e^x


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
b = 2
n = 3
r = Rational(2,3)

lst_vx = [exp(x),
sin(x),
cos(x),
1/x,
x,
x**2,
x**n,
1/x**2,
1/x**n,
1/sqrt(x),
x**r,
sqrt(x)]

i = choice(param['form'])
vx = lst_vx[i]
v = Lambda(x, vx)

lst_ux = [a*x,
a*x**2,
a*x + b,
a*x**2 + b,
a*x**2 + b*x,
a*x**n,
a*sin(x),
a*cos(x),
a*exp(x)]

i = choice(param['u'])
ux = lst_ux[i]

f = alpha*diff(ux, x)*v(ux)


sol = integrate(f, x).doit()
==
