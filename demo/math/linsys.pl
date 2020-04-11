extends = /model/mathinput.pl

title = Système linéaire


before ==
n = 2
A = rand_int_matrix_invertible(n, 3,[0], sparsity)
B = rand_int_matrix(n, 1, 3, [0])

sol = list(linsolve((A, B)))[0]
sol_tex = latex(sol)

sys_tex=latexsys(A,B)
lstvar=",".join(["x","y","z","t","u","v"][:n])

tuple_name=["couple","triplet","quadruplet","quintuplet"][n-2]
==

text ==
Déterminer la solution du système suivant (d'inconnues $! {{lstvar}} !$) :
$$ {{sys_tex}} $$
Ecrire la solution sous forme d'un {{tuple_name}} de nombres.
==

evaluator ==
score, error, feedback = eval_tuple(input.value, sol, checksize=True)
if error == "NotTuple" or error == "WrongSize":
    feedback = f"Votre réponse n'est pas un {tuple_name} de nombres."
==

solution == 
La solution est $! {{sol.tex}} !$.
==

