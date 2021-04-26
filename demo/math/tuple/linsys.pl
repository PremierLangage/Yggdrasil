extends = /model/math/tuple.pl

title = Système linéaire

before ==
from randsympy import rand_int_matrix, rand_int_matrix_invertible
from sympy import linsolve
from sympy2latex import latex_linsys
n = 3
lstvar = ",".join(["x", "y", "z", "t"][:n])

A = rand_int_matrix_invertible(n, 4, [0])
B = rand_int_matrix(n, 1, 3, [0])

sol = list(linsolve((A, B)))[0]

linsys = latex_linsys(A, B)
==

text ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{linsys}} $$
Ecrire la solution sous forme d'un couple de nombres.
==