extends = /model/mathmatrix.pl

title = Matrice définie par l'expression des coefficients

before ==
mat.setzeros(2)
var('i j')
a = randint(-2, 2, [0])
b = randint(-2, 2, [0])

expr = simplify(a*i+b*j)
[n,p]=list_randint_norep(2,2,3)
sol = Matrix(n, p, lambda i,j : a*(i+1)+b*(j+1))
==

text ==
Soit $!A!$ la matrice de taille $!{{n}} \times {{p}}!$ dont les
coefficients sont définis par l'expression $! a_{i,j} = {{ expr|latex }} !$.
Déterminer les coefficients de la matrice $!A!$.

*Note : La matrice est redimensionnable.*
==