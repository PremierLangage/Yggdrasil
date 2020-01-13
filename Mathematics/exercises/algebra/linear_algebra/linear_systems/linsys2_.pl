extends = /Mathematics/template/mathinput.pl

title = Système linéaire


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n=int(param['size'])
coeffbound = int(param['coeffbound'])
sparsity=float(param['sparsity'])
A=rand_int_matrix_invertible(n,coeffbound,[0],sparsity)
B=rand_int_matrix(n,1,coeffbound)
sol=list(linsolve((A, B)))[0]
sys_tex=latexsys(A,B)
sol_tex=latex(sol)
==

text ==
Déterminer les solutions du système
$$ {{sys_tex}} $$
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"tuple")
==

solution == 
La solution est $! {{sol_tex}} !$.
==
