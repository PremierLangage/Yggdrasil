extends = /model/math/tuple.pl

title = Image d'une application

before ==
from sympy import Lambda

var('n')
lst = [n, n+1, n-1, 2*n, 2*n+1, 2*n-1]
f1 = choice(lst)
f2 = choice(lst)
f = Lambda(n, (f1, f2))

n0 = randint(-5, 5)

sol = f(n0)
==

text ==
On considère la fonction $! f : \mathbb{Z} \rightarrow \mathbb{Z} \times \mathbb{Z}  !$ telle que :
$$ f(n)= ({{ f1|latex }}, {{ f2|latex }}).$$

Déterminer $! f( {{n0}} ). !$
==

