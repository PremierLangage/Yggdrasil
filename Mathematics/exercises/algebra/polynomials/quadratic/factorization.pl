extends = quadratic.pl

title = Factorisation d'un polynôme quadratique

text ==
Factoriser le polynôme $$ {{latexP}}. $$
==

evaluator==
var('x')
score,numerror,feedback=ans_poly_factor(answer['1'],x,P)
==

