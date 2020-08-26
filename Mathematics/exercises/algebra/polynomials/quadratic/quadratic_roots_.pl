extends = quadratic_.pl

title = Equation quadratique

text ==
Déterminer les solutions de l'équation $% {{P|latex}} = 0 %$. Séparer les différentes solutions par une virgule.
==

evaluator ==
score, error = eval_set(input.value, lstsol, wobracket=True)
feedback = feedback_message[error]
==

solution ==
{{solution_roots}}
==



