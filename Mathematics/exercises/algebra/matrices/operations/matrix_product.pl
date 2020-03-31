extends = /model/mathmatrix.pl

title==
Produit de matrices
==

before==
A = rand_int_matrix_fullrank(nbeq, n, 3, excluded_values=[0])

matrix.setmatrix(M)
==

text==
$$ A = {{M.tex}} $$ 
==

text ==
Calculer $! A B !$.
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==
