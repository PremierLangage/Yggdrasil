# Author : D. Doyen
# Last update : 10/01/21
# Keywords : linear systems

extends = /model/math/tuple.pl

title = Système linéaire

before ==
from randsympy import randint_matrix, randint_matrix_inv
from sympy import linsolve
n = param['size']
coeffboundA = param['coeffboundA']
coeffboundB = param['coeffboundB']
sparsity = param['sparsity']

if 'maxdet' in param:
    A=randint_matrix_inv(n,coeffboundA,[0], sparsity, param['mindet'], param['maxdet'])
else:
    A=randint_matrix_inv(n, coeffboundA,[0],sparsity)
if param['typesol']=="rat":
    B=randint_matrix(n,1,coeffboundB,[0])
else:
    sol=randint_matrix(n,1,5)
    B=A*sol

sol = list(linsolve((A, B)))[0]
sol_tex = latex(sol)

sys_tex=latex_linsys(A,B)
lstvar=",".join(["x","y","z","t","u","v"][:n])

tuple_name=["couple","triplet","quadruplet","quintuplet"][n-2]
==

question ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$
Ecrire la solution sous forme d'un {{tuple_name}} de nombres.
==
