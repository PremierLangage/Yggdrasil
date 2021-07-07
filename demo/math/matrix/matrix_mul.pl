extends = /model/math/matrix.pl


before ==
from randsympy import rand_int_matrix
n = 2
coeffbound = 3
A = rand_int_matrix(n, n, coeffbound)
B = rand_int_matrix(n, n, coeffbound)
sol = A*B
==

question ==
Soit les matrices
$$ A = \left( {{ A|latex }} \right) \text{ et } B = \left( {{ B|latex }} \right) $$ 
Calculer $! A B !$.
==

resizable = False