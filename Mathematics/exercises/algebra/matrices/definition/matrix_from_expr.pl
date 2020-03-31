extends = /model/mathmatrix.pl

text ==
Soit $!A!$ la matrice de taille $!\n \times \p!$ dont les
coefficients sont définis par l'expression $! a_{i,j} = {{expr.tex}} !$.
Déterminer les coefficients de la matrice $!A!$.
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==
