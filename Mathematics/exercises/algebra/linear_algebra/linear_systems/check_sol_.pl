extends = /Mathematics/template/mathradio.pl

title = Système linéaire


before ==
n=param['size']
coeffbound = param['coeffbound']
sparsity= param['sparsity']
A=rand_int_matrix_invertible(n,coeffbound,[0],sparsity)

choices=[]
while len(choices)<4:
    vec=list_randint(n,-3,3,[0])
    if vec not in choices:
        choices.append(vec)

B=rand_int_matrix(n,1,3,[0])
sol=list(linsolve((A, B)))[0]
sys_tex=latexsys(A,B)
sol_tex=latex(sol)
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

