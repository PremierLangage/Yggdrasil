extends = /model/math/tuple.pl

before ==
n = param['n']
A = randmat_invertible(n, 2, mindet=0, maxdet=6)

B = randmat(n, 1, 2, [0])

sol = list(linsolve((A, B)))[0]
sol_tex = latex(sol)

sys_tex=latexsys(A,B)
basis = str(tuple([tuple(A.col(i)) for i in range(n)]))
vec = str(tuple(B))

tuple_name=["couple","triplet","quadruplet","quintuplet"][n-2]
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^{{n}} !$ et on considère la base 

$$ \mathcal{B} = {{basis}}.$$

Déterminer les coordonnées du vecteur $! {{vec}} !$ dans cette base (écrire les coordonnées sous forme d'un {{tuple_name}} de nombres).
==

evaluator ==
score, error, feedback = eval_tuple(input.value, sol, checksize=True)
if error == "NotTuple" or error == "WrongSize":
    feedback = f"Votre réponse n'est pas un {tuple_name} de nombres."
==

solution == 
La solution est $! {{sol_tex}} !$.
==

