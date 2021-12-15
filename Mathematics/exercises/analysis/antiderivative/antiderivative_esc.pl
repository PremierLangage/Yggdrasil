extends = antiderivative_.pl

title = Calcul de primitive

before ==
from sympy import integrate
x = Symbol('x')
a = choice ([Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4])
b = randint(-3, 3, [0])
i = randint(0, 2)
u = [exp(a*x), sin(a*x), cos(a*x)][i]
du = [exp(a*x), cos(a*x), sin(a*x)][i]
g = choice([exp, sin, cos])
f = du*g(u)
sol = integrate(f, x).doit()
==


