extends = /model/math/matrix.pl

title==
Produit de matrices
==

before ==
from randsympy import randmat
if isinstance(param['size'][0], list):
    n, m = randitem(param['size'])
else:
    n, m = param['size']
    
coeffbound = param['coeffbound']

ininitsize = [n, m]

a, b = sample([-2, -1, 1, 2], 2)
var('A B')
expr = simplify(a*A + b*B)
MA = randmat(n, m, coeffbound)
MB = randmat(n, m, coeffbound)
sol = a*MA+b*MB
==

question ==
Soit les matrices
$$ A = {{ MA|latex }} \text{ et } B = {{ MB|latex }} $$ 
Calculer $! {{expr|latex}} !$.
==