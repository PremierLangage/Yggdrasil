extends = /model/math/matrix.pl


before ==
from randsympy import randint_matrix
n = 2
coeffbound = 3
A = randint_matrix(n, n, coeffbound)
B = randint_matrix(n, n, coeffbound)
sol = A*B
==

question ==
Soit les matrices
$$ A = \left( {{ A|latex }} \right) \text{ et } B = \left( {{ B|latex }} \right) $$ 
Calculer $! A B !$.
==

resizable = False