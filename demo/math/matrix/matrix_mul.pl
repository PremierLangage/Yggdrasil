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
$$ A = {{ A|latex }} \text{ et } B = {{ B|latex }} $$ 
Calculer $! A B !$.
==

resizable = False