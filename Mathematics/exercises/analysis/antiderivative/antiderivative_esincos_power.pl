extends = antiderivative_.pl

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
d = randint(2, 4)
u = a*x**d
du = x**(d-1)
g = choice([exp, sin, cos])
f = b*du*g(u)
sol = integrate(f, x).doit()
==
