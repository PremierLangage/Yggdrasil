# Author : D. Doyen
# Last update : 10/01/21
# Keywords : linear systems

extends = /model/math/tuple.pl

title = Système linéaire


before == #|py|
from sympy import linsolve
from sympy2latex import latex_linsys
n = param['size']
coeffboundA = param['coeffboundA']
coeffboundB = param['coeffboundB']
sparsity = param['sparsity']
detbound = param['detbound']

A = randmat_invertible(n,coeffboundA,[0], sparsity=sparsity, detbound=detbound)

if param['typesol']=="rat":
    B = randmat(n,1,coeffboundB,[0])
else:
    sol=randmat(n,1,5)
    B=A*sol

sol = list(linsolve((A, B)))[0]

sys_tex=latex_linsys(A,B)
lstvar=",".join(["x","y","z","t","u","v"][:n])

tuple_name=["couple","triplet","quadruplet","quintuplet"][n-2]
==

question ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$
Ecrire la solution sous forme d'un {{tuple_name}} de nombres.
==
