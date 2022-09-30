extends = /model/math/complex.pl

title = Discriminant d'une équation du second degré


before ==
a = rand_complex_int(3)
b = rand_complex_int(3)
c = rand_complex_int(4)
x = Symbol('z')
P = a*x**2+b*x+c

sol = (b*b-4*a*c).expand()
==

question ==
Calculer le discriminant de l'équation $! {{P|latex}} = 0 !$.
==
