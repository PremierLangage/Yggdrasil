extends = guided_solving_.pl

before ==
inputs = [MathInput(type="expr") for _ in range(3)]
from sympy import Function, solveset, Eq
var('t')
var('k')
y = symbols('y', cls=Function)
a = randint(-3, 3, [0])
b = randint(-3, 3, [0])
c = randint(-3, 3, [0])
rhs = a*y(t) + b * t + c
expr = y(t).diff(t) - rhs
psol = - b/a * t -c/a
y0 = randint(-2, 2)
k0 = list(solveset(Eq(k-psol, y0), k))[0]
sols = [psol, k*E**(-a*t)-psol, k0*E**(-a*t)-psol]
==