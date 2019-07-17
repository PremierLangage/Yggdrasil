extends = quadratic0.pl

title = Racines des polynômes quadratiques

param.roots = rat

text ==
{{setsol}}
Déterminer la ou les racines du polynôme $$ {{latexP}}. $$
==

evaluator==
score,_,feedback=ans_list_frac(answer['1'],setsol)
==


