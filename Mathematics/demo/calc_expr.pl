extends = /model/math/frac.pl

title = Calcul d'une expression numérique

before ==
a = randint(2, 5)
b = randint(2, 5)
c = randint(2, 5)
s = randitem("+", "-")

expr = r"\frac{ %s %s %s }{ %s }" % (a, s, b, c)
sol = simplify(latex2sympy(expr))
==

text ==
Calculer l'expression $! \displaystyle {{expr}} !$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==


