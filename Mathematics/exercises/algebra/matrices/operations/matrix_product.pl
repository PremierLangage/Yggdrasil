extends = /model/mathmatrix.pl

title==
Produit de matrices
==

before==
mat.setmatrix([[0,0],[0,0]])
n = 2
m = 2
p = 2
A = rand_int_matrix(n, m, 2)
B = rand_int_matrix(m, p, 2)
Msol = A*B
==

text==
$$ A = {{A.latex}} $$ 
$$ A = {{A.latex}} $$ 
Calculer $! A B !$.
==


evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==

solution ==
La solution est $$\left( {{Msol.latex}} \right).$$
==
