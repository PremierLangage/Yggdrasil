extends = /model/math/tuple.pl

title = Système linéaire

before ==
from randsympy import randint_matrix, randint_matrix_inv
from sympy import linsolve
from sympy2latex import latex_linsys

n = 2
lstvar = ",".join(["x", "y", "z", "t"][:n])

A = randint_matrix_inv(n, 10, [1])
B = randint_matrix(n, 1, 5, [0])

sol = list(linsolve((A, B)))[0]

linsys = latex_linsys(A, B)
==

text ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{linsys}} $$
Ecrire la solution sous forme d'un couple de nombres.
==