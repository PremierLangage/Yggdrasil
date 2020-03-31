extends = /model/mathmatrix.pl

title==
Produit de matrices
==

before==
M = Matrix([[1,2],[4,5]])
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
