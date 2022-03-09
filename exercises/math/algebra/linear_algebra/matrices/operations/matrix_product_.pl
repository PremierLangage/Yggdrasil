extends = /model/math/matrix.pl

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

A = randint_matrix(n, m, coeffbound)
B = randint_matrix(m, p, coeffbound)
sol = A*B
==

text==
Soit les matrices
$$ A =  {{A|latex}} \text{ et } B = {{B|latex}} $$ 
Calculer $! A B !$.
==