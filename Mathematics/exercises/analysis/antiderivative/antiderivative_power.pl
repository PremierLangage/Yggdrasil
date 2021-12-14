extends = antiderivative_.pl

before ==
x = Symbol('x')
a = randint(-5, 5, [0])
b, c = sample(2, [-5, -4, -3, -2, -1, 1, 2, 3, 4, 5])
d = randint(4,7)
f = a*(b*x+c)**d
sol = simplify(Rational(a, b*(d+1))*(b*x + c)**(d+1))
==


