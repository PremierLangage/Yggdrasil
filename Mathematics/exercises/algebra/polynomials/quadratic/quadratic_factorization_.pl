extends = quadratic_.pl

title = Factorisation d'un polynôme quadratique

text ==
Factoriser le polynôme $$ {{latexP}}. $$
==

evaluator==
var('x')
score,numerror,feedback=eval_poly(input.value,P,x, form ="factorized")
==

input =: MathInput

form ==
{{ input | component }}
==

solution ==
{{solution_factor}}
==



