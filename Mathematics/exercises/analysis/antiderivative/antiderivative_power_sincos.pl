extends = antiderivative_.pl

before ==
from sympy import integrate
x = Symbol('x')
a = choice ([Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4])
b = randint(-3, 3, [0])
i = randint(0, 1)
u = [sin(a*x), cos(a*x)][i]
du = [cos(a*x), sin(a*x)][i]
d = randint(1, 3)
f = du*(u)**d
sol = integrate(f, x).doit()
==
