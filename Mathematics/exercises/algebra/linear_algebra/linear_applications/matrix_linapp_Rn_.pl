extends = /model/mathmatrix.pl

title = Matrice d'une application linéaire

before ==
n = 3
m = 2

lstvar = ",".join(["x","y","z","t","u","v"][:n])

A = rand_int_matrix_fullrank(n, m, 3)
expr = ",".join([latex_lincomb(A.row(j)) for j in m])
==

text ==
On considère l'application linéaire $! f : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{m}} !$ telle que
$$ f({{lstvar}} = ( {{expr}} ) .$$
Déterminer une base de ce sous-espace (écrire cette base comme un ensemble, entre accolades).
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), A)
==

solution ==
La solution est $$\left( {{A.latex}} \right).$$
==





