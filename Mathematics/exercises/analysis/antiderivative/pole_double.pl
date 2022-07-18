extends = antiderivative_.pl

title = Calcul de primitive (élément simple)

lang = fr

before ==

var('x')
a = randint(-5, 5, [0])
b, c = sample([-5, -4, -3, -2, -1, 1, 2, 3, 4, 5], 2)

f = simplify(a/(b*x+c)**2)
sol = simplify(integrate(f,x))
==

