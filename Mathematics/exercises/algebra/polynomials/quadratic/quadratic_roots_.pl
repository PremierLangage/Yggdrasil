extends = quadratic_.pl

title = Equation quadratique

text ==
Déterminer les solutions de l'équation $% {{latexP}} = 0 %$. Séparer les différentes solutions par une virgule.
==

evaluator==
score,_,feedback=ans_set_expr(input1.value,lstsol,formal=False)
==

solution ==
{{solution_roots}}
==


