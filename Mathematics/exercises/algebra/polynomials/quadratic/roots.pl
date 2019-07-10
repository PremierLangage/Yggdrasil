extends = quadratic.pl

title = Racines d'un polynôme quadratique

text ==
Déterminer la ou les racines du polynôme $$ {{latexP}}. $$
==

evaluator==
score,_,feedback=ans_list_frac(answer['1'],lstsol)
feedback=lstsol
==

