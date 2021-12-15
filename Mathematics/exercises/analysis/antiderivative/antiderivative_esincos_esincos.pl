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
i = randint(0, 2)
u = [exp(a*x), sin(a*x), cos(a*x)][i]
du = [exp(a*x), cos(a*x), sin(a*x)][i]
g = choice([exp, sin, cos])
f = b*du*g(u)
sol = integrate(f, x).doit()
==
