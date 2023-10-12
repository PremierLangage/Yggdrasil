extends = /model/math/complex.pl

title = Discriminant d'une équation du second degré

complex_form = "Cartesian"

before ==
a = randint(-4,4) + I*randint(-4,4,[0])
b = randint(-4,4) + I*randint(-4,4)
c = randint(-4,4) + I*randint(-4,4)
x = Symbol('z')
P = Poly(a*x**2+b*x+c, x)

sol = (b*b-4*a*c).expand()
==

question ==
Calculer le discriminant de l'équation $! {{P|latex}} = 0 !$.
==
