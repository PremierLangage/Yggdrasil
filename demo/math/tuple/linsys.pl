extends = /model/mathinput.pl

title = Système linéaire

before ==
n = 2
lstvar = ",".join(["x", "y", "z", "t"][:n])

A = rand_int_matrix_invertible(n, 3, [0])
B = rand_int_matrix(n, 1, 3, [0])

sol = list(linsolve((A, B)))[0]

linsys = latex_linsys(A,B)
==

text ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{linsys}} $$
Ecrire la solution sous forme d'un couple de nombres.
==

evaluator ==
score, feedback = eval_tuple(input.value, sol, checksize=True)
==

solution == 
La solution est $! {{sol|latex}} !$.
==

