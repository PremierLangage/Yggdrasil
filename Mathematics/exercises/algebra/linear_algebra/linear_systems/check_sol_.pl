extends = /Mathematics/template/mathradio.pl

title = Système linéaire


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

sys_tex=latexsys(A,B)
radio.loadContent(choices)
radio.setSolByIndex(0)
radio.shuffle()
==

text ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"tuple")
==

solution == 
La solution est $! {{sol_tex}} !$.
==

