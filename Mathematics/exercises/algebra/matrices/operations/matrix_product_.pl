extends = /model/mathmatrix.pl

title==
Produit de matrices
==

before==
if isinstance(param['size'][0], list):
    n, m, p = randitem(param['size'])
else:
    n, m, p = param['size']
    
coeffbound = param['coeffbound']

min = min([n, m, p])
mat.setmatrix([min * [0] for _ in range(min)])

A = rand_int_matrix(n, m, coeffbound)
B = rand_int_matrix(m, p, coeffbound)
Msol = A*B
==

text==
Soit les matrices
$$ A = \left( {{A.latex}}\right) \text{ et } B = \left({{B.latex}}\right) $$ 
Calculer $! A B !$.
==
form ==
$$ A = \left( {{A.latex}}\right)
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==

solution ==
La solution est $$\left( {{Msol.latex}} \right).$$
==

