extends = /model/mathmatrix.pl

title = Matrice d'une application linéaire

before ==
n, m = rd.choice(param['sizes'])

lstvar = ",".join(["x","y","z","t","u","v"][:n])

min = min([n, m])
mat.setmatrix([min * [0] for _ in range(min)])

A = rand_int_matrix_fullrank(m, n, 3)
expr = ",".join([latex_lincomb(A.row(j),['x','y','z','t']) for j in range(m)])
==

text ==
On considère l'application linéaire $! f : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{m}} !$ telle que
$$ f({{lstvar}}) = ( {{expr}} ) .$$
Déterminer la matrice de cette application linéaire par rapport aux bases canoniques de espaces de départ et d'arrivée.
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), A)
==

solution ==
La solution est $$\left( {{A.latex}} \right).$$
==





