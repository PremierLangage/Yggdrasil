extends = /model/math.pl


before ==
dim = []
family = []
n = 2
case = 0
if case == 0:
    A = rand_int_matrix_givenrank(2, 4, 2, magnitude=2)
else == 3:
    A = rand_int_matrix_givenrank(3, 4, 2, magnitude=1)

dim.append(n)
family.append(', '.join([str(tuple(A.row(i))) for i in range(n)]))
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^{{n}} !$. La famille de vecteurs suivante est-elle libre ?

$$ \mathcal{F} = \\{ {{ family[step] }} \\}.$$
==

form ==
{{ radio[step]|component }}

evaluator ==
score, error, feedback = eval_tuple(input.value, sol, checksize=True)
if error == "NotTuple" or error == "WrongSize":
    feedback = f"Votre réponse n'est pas un {tuple_name} de nombres."
==

solution == 
La solution est $! {{sol_tex}} !$.
==


