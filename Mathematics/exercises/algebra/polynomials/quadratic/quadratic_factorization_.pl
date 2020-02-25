extends = quadratic_.pl

title = Factorisation d'un polynôme quadratique

text ==
Factoriser le polynôme $$ {{latexP}}. $$
==

evaluator==
var('x')
score,numerror,feedback=eval_poly(input1.value,P,x, form ="factorized")
==

solution ==
{{solution_factor}}
==



