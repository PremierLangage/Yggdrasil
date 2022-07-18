# D. Doyen
# 10/3/22
# matrices
# Multiplier deux matrices

extends = /model/math/matrix.pl

title ==
Produit de matrices
==

before ==
from randsympy import randmat

if isinstance(param['size'][0], list):
    n, m, p = randitem(param['size'])
else:
    n, m, p = param['size']
    
coeffbound = param['coeffbound']

min = min([n, m, p])

A = randmat(n, m, coeffbound)
B = randmat(m, p, coeffbound)
sol = A*B
==

tquestio ==
Soit les matrices
$$ A =  {{A|latex}} \text{ et } B = {{B|latex}} $$ 
Calculer $! A B !$.
==