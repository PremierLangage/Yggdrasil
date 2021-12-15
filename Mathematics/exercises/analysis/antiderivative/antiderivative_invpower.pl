extends = antiderivative_.pl

before ==
x = Symbol('x')
a = randint(-5, 5, [0])
b, c = sample([-5, -4, -3, -2, -1, 1, 2, 3, 4, 5], 2)
d = randint(4,7)

b0 = Rational(-c, b)
if b > 0:
    dom=r"\rbrack %s ,+\infty\lbrack" % latex(b0)
else:
    dom=r"\rbrack -\infty, %s \lbrack" % latex(b0)

f = a/(b*x+c)**d
f = simplify(f)
sol = integrate(f,x).doit()
==

question ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{ f|latex}} $$
sur l'intervalle $! {{dom}} !$.
==
