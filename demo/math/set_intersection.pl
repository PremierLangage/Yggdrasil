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
On considère les ensembles suivants :
$$ A=  {{A.latex}}, B={{B.tex}}.$$
Déterminer $! A \cap B !$.
==

input =: MathInput

form==
$$ A=  {{A.latex}}, B={{B.latex}}.$$

{{input|component}}
==

evaluator ==
score,_,feedback=eval_set(input.value,sol)
==

solution ==
La solution est $! { {{sol.latex}} } !$.
==


