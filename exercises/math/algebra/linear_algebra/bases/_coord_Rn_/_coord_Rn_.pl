extends = /model/math/tuple.pl

before ==
from randsympy import randmat_invertible, randmat
from sympy import linsolve
n = param['n']
A = randmat_invertible(n, 2, detbound=[0, 6])

B = randmat(n, 1, 2, [0])

sol = list(linsolve((A, B)))[0]

basis = str(tuple([tuple(A.col(i)) for i in range(n)]))
vec = str(tuple(B))
tuple_name = ['couple', 'triplet', 'quadruplet'][n-2]
==

question ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^{{n}} !$ et on considère la base 

$$ \mathcal{B} = {{basis}}.$$

Déterminer les coordonnées du vecteur $! {{vec}} !$ dans cette base (écrire les coordonnées sous forme d'un {{tuple_name}} de nombres).
==