extends = /Mathematics/template/mathinput.pl

title = Système linéaire


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON
n=param['size']
coeffbound = param['coeffbound']
sparsity= param['sparsity']

if 'maxdet' in param:
    A=rand_int_matrix_invertible(n,coeffbound,[0],sparsity,param['mindet'],param['maxdet'])
else:
    A=rand_int_matrix_invertible(n,coeffbound,[0],sparsity)

B=rand_int_matrix(n,1,coeffbound,[0])
sol=list(linsolve((A, B)))[0]
sys_tex=latexsys(A,B)
sol_tex=latex(sol)
lstvar=",".join(["x","y","z","t","u","v"][:n])

input.value="("+",".join(n*["?"])+")"

tuple_name=["couple","triplet","quadruplet","quintuplet"][n-2]
==

text ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$
Ecrire la solution sous forme d'un {{tuple_name}} de nombres.
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"tuple")
==

solution == 
La solution est $! {{sol_tex}} !$.
==

input.debug % true
