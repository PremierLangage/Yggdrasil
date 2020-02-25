extends = /model/math.pl

title = Intersection d'ensembles

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

A=rand_finiteset(randint(4,7),list(range(10)))
B=rand_finiteset(randint(4,7),list(range(10)))


sol = Intersection(A,B)

A_tex=latex(A)
B_tex=latex(B)
sol_tex=latex(sol)
==

text == 
On considère les ensembles suivants :
$$ A=  {{A_tex}}, B={{B_tex}}.$$
Déterminer $! A \cap B !$.
==

input =: MathInput

form==
{{input|component}}
==

evaluator ==
score,_,feedback=eval_set(input.value,sol)
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==


