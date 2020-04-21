extends = /model/mathmatrix.pl

before ==
n = 3
m = 2

lstvar = ",".join(["x","y","z","t","u","v"][:n])

A = rand_int_matrix_fullrank(n, m, 3)
B=zeros(nbeq, 1)
sys_tex = latexsys(A, B)
==

text ==
On considère l'application linéaire $! f : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{n}} !$ telle que
$$ f({{lstvar}} = ( {{sys_tex}} ) .$$
Déterminer une base de ce sous-espace (écrire cette base comme un ensemble, entre accolades).
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==

solution ==
La solution est $$\left( {{sol.latex}} \right).$$
==




