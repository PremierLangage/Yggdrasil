extends = quadratic0.pl

title = Factorisation de polynômes quadratiques

param.roots = int

text ==
Factoriser le polynôme $$ {{latexP}}. $$
==

evaluator==
score,_,feedback=ans_interval(answer['1'],sol)
==



