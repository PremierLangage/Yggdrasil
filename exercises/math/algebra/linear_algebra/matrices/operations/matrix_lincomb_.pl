extends = /model/math/matrix.pl

title==
Produit de matrices
==

before ==
from randsympy import randint_matrix
if isinstance(param['size'][0], list):
    n, m = randitem(param['size'])
else:
    n, m = param['size']
    
coeffbound = param['coeffbound']

ininitsize = [n, m]

a, b = sample([-2, -1, 1, 2], 2)
var('A B')
expr = simplify(a*A + b*B)
MA = randint_matrix(n, m, coeffbound)
MB = randint_matrix(n, m, coeffbound)
sol = a*MA+b*MB
==

question ==
Soit les matrices
$$ A = \left( {{ MA|latex }}\right) \text{ et } B = \left({{ MB|latex }}\right) $$ 
Calculer $! {{expr|latex}} !$.
==