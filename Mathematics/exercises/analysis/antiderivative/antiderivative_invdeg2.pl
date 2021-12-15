extends = antiderivative_.pl

before ==
x = Symbol('x')
a = randint(-5, 5, [0])
b, c = sample([-5, -4, -3, -2, -1, 1, 2, 3, 4, 5], 2)

f = a/(b*x**2+c)
f = simplify(f)
sol = integrate(f,x).doit()
==
