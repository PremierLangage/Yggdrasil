extends = /model/math.pl
extends = /model/basic/radio.pl
title = Vérifier une solution

before ==
n=param['size']
coeffbound = param['coeffbound']
sparsity= param['sparsity']
A=rand_int_matrix_invertible(n,3)
vec=list_randint(n,-3,3,[0])
B=A*Matrix(vec)

vec_tex=str(tuple(vec))
k=randint(0,n)

if k>0:
    B[k-1]+=randitem([-1,1])

choices=["Oui",
         "Non, car la 1ère équation n'est pas vérifiée.",
         "Non, car la 2e équation n'est pas vérifiée.",
         "Non, car la 3e équation n'est pas vérifiée."]

lstvar=",".join(["x","y","z","t","u","v"][:n])
tuple_name=["couple","triplet","quadruplet","quintuplet"][n-2]

sys_tex=latexsys(A,B)
radio.setitems(choices)
radio.setsol_from_index(k)
==

text ==
On considère le système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$

Le {{tuple_name}} $! {{vec_tex}} !$ est-il solution de ce système ?
==

