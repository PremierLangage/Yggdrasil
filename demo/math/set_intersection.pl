extends = /model/mathinput.pl

title = Intersection d'ensembles

input.virtualKeyboards = sets

before ==
A=rand_finiteset(randint(4,7),list(range(10)))
B=rand_finiteset(randint(4,7),list(range(10)))

sol = Intersection(A,B)
==

text ==
On considère les ensembles suivants :
$$ A=\\{ {{A.latex}} \\},\ B=\\{ {{B.latex}} \\}.$$
Déterminer $! A \cap B !$.
==

evaluator ==
score,_,feedback=eval_set(input.value,sol)
==

solution ==
La solution est $! { {{sol.latex}} } !$.
==


