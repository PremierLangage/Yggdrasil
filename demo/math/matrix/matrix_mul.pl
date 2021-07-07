extends = /model/math/matrix.pl


before ==
from randsympy import rand_int_matrix
n = 2
coeffbound = 3
A = randmatrix(n, n, coeffbound)
B = randmatrix(n, n, coeffbound)
sol = A*B
==

question ==
Soit les matrices
$$ A = \left( {{ A|latex }} \right) \text{ et } B = \left( {{ B|latex }} \right) $$ 
Calculer $! A B !$.
==

resizable = False