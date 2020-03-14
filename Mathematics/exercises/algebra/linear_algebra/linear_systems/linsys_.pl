extends = /model/math.pl

title = Système linéaire


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON
n=param['size']
coeffboundA = param['coeffboundA']
coeffboundB = param['coeffboundB']
sparsity= param['sparsity']
if 'maxdet' in param:
    A=rand_int_matrix_invertible(n,coeffboundA,[0],sparsity,param['mindet'],param['maxdet'])
else:
    A=rand_int_matrix_invertible(n,coeffboundA,[0],sparsity)
if param['typesol']=="rat":
    B=rand_int_matrix(n,1,coeffboundB,[0])
else:
    sol=rand_int_matrix(n,1,5)
    B=A*sol

sol=list(linsolve((A, B)))[0]
sol_tex = latex(sol)

sys_tex=latexsys(A,B)
lstvar=",".join(["x","y","z","t","u","v"][:n])

tuple_name=["couple","triplet","quadruplet","quintuplet"][n-2]
==

text ==
{{sol}}
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$
Ecrire la solution sous forme d'un {{tuple_name}} de nombres.
==

evaluator ==
score, error, feedback = eval_tuple(input.value, sol, checksize=True)
if error == "NotTuple":
    feedback = f"Votre réponse n'est pas un {tuple_name} de nombres."
==

solution == 
La solution est $! {{sol_tex}} !$.
==



