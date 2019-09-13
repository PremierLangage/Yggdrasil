extends = quadratic_.pl

title = Factorisation d'un polynôme quadratique

text ==
Factoriser le polynôme $$ {{latexP}}. $$
==

evaluator==
var('x')
score,numerror,feedback=ans_poly_factor(input1.value,P,x)
==

solution ==
{{solution_factor}}
==


