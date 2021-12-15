extends = antiderivative_.pl

before ==
from sympy import integrate
x = Symbol('x')
a = choice ([Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4])
b = randint(-3, 3, [0])
d = randint(2, 4)
u = x**d
du = x**(d-1)
g = choice([exp, sin, cos])
f = du*g(u)
sol = integrate(f, x).doit()
==
