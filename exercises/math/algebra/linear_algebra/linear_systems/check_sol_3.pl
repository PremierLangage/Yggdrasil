# Author : D. Doyen
# Last update : 08/01/21
# Keywords : linear systems

extends = /model/math/math.pl
extends = /model/basic/radio.pl

title = Vérifier une solution

choices ==
Oui
Non, car la 1ère équation n'est pas vérifiée.
Non, car la 2e équation n'est pas vérifiée.
Non, car la 3e équation n'est pas vérifiée.
==

shuffle % false

before ==
n = 3
bound = 3
A = randint_matrix_invertible(n, bound, excluded_values=[0])
vec = list_randint(n, -3, 3)
B = A*Matrix(vec)
vec = tuple(vec)

indexsol = randint(0, n)
if indexsol > 0:
    B[indexsol-1] += randitem([-2, -1, 1, 2])

sys_tex = latex_linsys(A, B)
==

text ==
On considère le système suivant (d'inconnues $! x, y, z !$) :
$$ {{sys_tex}} $$

Le triplet $! {{vec|latex}} !$ est-il solution de ce système ?
==
