extends = /model/math.pl


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON
n = 2
A = rand_int_matrix_givenrank(2,4,2)


family = str(tuple([tuple(A.col(i)) for i in range(n)]))
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^{{n}} !$ et on considère la famille de vecteurs

$$ \mathcal{F} = {{ family }}.$$

Cette famille est-elle libre ?
==

evaluator ==
score, error, feedback = eval_tuple(input.value, sol, checksize=True)
if error == "NotTuple" or error == "WrongSize":
    feedback = f"Votre réponse n'est pas un {tuple_name} de nombres."
==

solution == 
La solution est $! {{sol_tex}} !$.
==

