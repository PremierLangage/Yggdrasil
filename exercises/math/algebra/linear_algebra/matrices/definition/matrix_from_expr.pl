# D. Doyen
# 10/3/22
# matrices
# Déterminer les coefficients d'un matrice définie par une expression.

extends = /model/math/matrix.pl

title = Matrice définie par l'expression des coefficients

initsize = [2, 2]

resizable = True

before ==
var('i j')
a = randint(-2, 2, [0])
b = randint(-2, 2, [0])
expr = simplify(a*i+b*j)

[n, p] = sample([2, 3], 2)

sol = Matrix(n, p, lambda i,j : a*(i+1)+b*(j+1))
==

question ==
Soit $!A!$ la matrice de taille $!{{n}} \times {{p}}!$ dont les
coefficients sont définis par l'expression $! a_{i,j} = {{ expr|latex }} !$.
Déterminer les coefficients de la matrice $!A!$.
==