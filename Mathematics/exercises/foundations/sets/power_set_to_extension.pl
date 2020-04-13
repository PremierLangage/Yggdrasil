extends = /model/mathinput.pl

title = Ensemble des parties d'un ensemble

before ==

A=rand_finiteset(randint(2,3),list(range(10)))
A_tex=latex(A)
sol=A.powerset()
sol_tex=latex(sol)
==

text == 
Ecrire en extension l'ensemble $! \mathcal{P}(\\{ {{A_tex}}\\} ) !$.
==

evaluator ==
score, _, feedback = eval_set(input.value, sol)
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==


