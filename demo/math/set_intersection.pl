extends = /model/math.pl

title = Intersection d'ensembles

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

A=rand_finiteset(randint(4,7),list(range(10)))
B=rand_finiteset(randint(4,7),list(range(10)))

sol = Intersection(A,B)
==

text ==
$$ A=  {{A.latex}}, B={{B.latex}}.$$
==

input =: MathInput

form ==
On considère les ensembles suivants :
$$ A={{A.latex}},\ B={{B.latex}}.$$
Déterminer $! A \cap B !$.

{{input|component}}
==

evaluator ==
score,_,feedback=eval_set(input.value,sol)
==

solution ==
La solution est $! { {{sol.latex}} } !$.
==
