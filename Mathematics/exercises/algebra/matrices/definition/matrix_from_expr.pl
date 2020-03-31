extends = /model/mathmatrix.pl

title = Matrice définie par l'expression des coefficients

before ==
mat.setmatrix([[0,0],[0,0]])
var('i j')
def f(x, y):
    a=randint(-2,2,[0])
    b=randint(-2,2,[0])
    return a*(x+1)+ b*(y+1)

expr = simplify(f(i, j))
[n,p]=list_randint_norep(2,2,3)
Msol = Matrix(n, p, f)
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
