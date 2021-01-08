extends = /model/math.pl
extends = /model/basic/radio.pl

title = Vérifier une solution

choices ==
Oui
Non, car la 1ère équation n'est pas vérifiée.
Non, car la 2e équation n'est pas vérifiée.
Non, car la 3e équation n'est pas vérifiée.
==

before ==
n = 3
A = rand_int_matrix_invertible(n, 3)
vec = list_randint(n,-3,3,[0])
B = A*Matrix(vec)

vec_tex=str(tuple(vec))
nbsol = randint(0, n)

if nbsol > 0:
    B[nbsol-1] += randitem([-2, -1, 1, 2])

sys_tex = latex_linsys(A, B)
==

text ==
On considère le système suivant (d'inconnues $! x, y, z !$) :
$$ {{sys_tex}} $$

Le triplet $! {{vec|latex}} !$ est-il solution de ce système ?
==

