extends = antiderivative_.pl

title = Calcul de primitive

before ==
from sympy import integrate
x = Symbol('x')
a = choice ([Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4])
b = randint(-3, 3, [0])
f = choice([exp(a*x+b), sin(a*x+b),cos(a*x+b)])
sol = integrate(f, x).doit()
==


