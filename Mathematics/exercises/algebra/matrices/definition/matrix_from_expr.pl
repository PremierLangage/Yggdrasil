extends = /model/mathmatrix.pl

title = Matrice définie par l'expression des coefficients

before ==
mat.setmatrix([[0,0],[0,0]])
var('i j')
def f(x, y):
    return x+1 + y+1

expr = f(i-1, j-1)
n = 3
p = 2
Msol = Matrix(n, p, f )
==

text ==
Soit $!A!$ la matrice de taille $!{{n}} \times {{p}}!$ dont les
coefficients sont définis par l'expression $! a_{i,j} = {{expr.latex}} !$.
Déterminer les coefficients de la matrice $!A!$.
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==

solution ==
La solution est $$ {{Msol.latex}}.$$
==
