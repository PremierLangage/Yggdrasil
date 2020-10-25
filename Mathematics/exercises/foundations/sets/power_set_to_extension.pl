extends = /model/mathinput.pl

title = Ensemble des parties d'un ensemble

input.virtualKeyboards = sets

before ==
A = rand_set(randint(2, 3), range(10))
sol = A.powerset()
==

text == 
Ecrire en extension l'ensemble $! \mathcal{P}(\\{ {{ A|latex }} \\}) !$.
==

evaluator ==
score, _, feedback = eval_set(input.value, sol)
==

solution ==
La solution est $! {{sol|latex}} !$.
==



