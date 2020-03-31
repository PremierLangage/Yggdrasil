extends = /model/mathmatrix.pl

title = Matrice définie par l'expression des coefficients

before ==
var('i j')
def f(x, y):
    return x + y

expr = f(i, j)
n = 3
p = 2
sol = Matrix(n, p, f )
==

text ==
Soit $!A!$ la matrice de taille $!{{n}} \times {{p}}!$ dont les
coefficients sont définis par l'expression $! a_{i,j} = {{expr.latex}} !$.
Déterminer les coefficients de la matrice $!A!$.
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==
