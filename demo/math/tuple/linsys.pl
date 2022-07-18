extends = /model/math/tuple.pl

title = Système linéaire

before ==
from randsympy import randmat, randmat_invertible
from sympy import linsolve
from sympy2latex import latex_linsys

n = 2
lstvar = ",".join(["x", "y", "z", "t"][:n])

A = randmat_invertible(n, 10, [1])
B = randmat(n, 1, 5, [0])

sol = list(linsolve((A, B)))[0]

linsys = latex_linsys(A, B)
==

question ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{linsys}} $$
Ecrire la solution sous forme d'un couple de nombres.
==