extends = /model/mathradio.pl

title = Trouver une solution parmi plusieurs

before ==
n=param['size']
coeffbound = param['coeffbound']
sparsity= param['sparsity']
A=rand_int_matrix_invertible(n,3)

vec=list_randint(n,-3,3)
B=A*Matrix(vec)
choices=["$! %s !$" % str(tuple(vec))]
while len(choices)<4:
    vec=list_randint(n,-3,3)
    if vec not in choices:
        choices.append("$! %s !$" % str(tuple(vec)))

lstvar=",".join(["x","y","z","t","u","v"][:n])
sys_tex=latexsys(A,B)

radio.setitems(choices)
radio.setsol_from_index(k)
radio.shuffle()
==

text ==
On considère le système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$

Parmi les propositions suivantes, laquelle est la solution de ce système ?
==

