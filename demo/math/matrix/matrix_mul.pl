# Author : D. Doyen
# Keywords : 

extends = /model/mathmatrix.pl

title==
Produit de matrices $! 2 \times 2 !$
==

before==
n = 2
coeffbound = 3
mat.setmatrix([n * [0] for _ in range(n)])

A = rand_int_matrix(n, n, coeffbound)
B = rand_int_matrix(n, n, coeffbound)
sol = A*B
==

text==
Soit les matrices
$$ A = \left( {{ A|latex }} \right) \text{ et } B = \left( {{ B|latex }} \right) $$ 
Calculer $! A B !$.
==

evaluator ==
score, feedback = eval_matrix(mat.getmatrix(), sol)
==

solution ==
La solution est $$\left( {{ sol|latex }} \right).$$
==



