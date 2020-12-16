extends = /model/mathmatrix.pl

title ==
Produit de matrices
==

before ==
if isinstance(param['size'][0], list):
    n, m, p = randitem(param['size'])
else:
    n, m, p = param['size']
    
coeffbound = param['coeffbound']

min = min([n, m, p])
mat.setzeros(min)

A = rand_int_matrix(n, m, coeffbound)
B = rand_int_matrix(m, p, coeffbound)
sol = A*B
==

text==
Soit les matrices
$$ A = \left( {{A.latex}}\right) \text{ et } B = \left({{B.latex}}\right) $$ 
Calculer $! A B !$.
==