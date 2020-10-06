extends = /model/mathinput.pl

title = Calcul d'intégrales

text ==
Calculer l'intégrale $! \displaystyle \int_{ {{x0_tex}} }^{ {{x1_tex}} } {{f_tex}} \, dx !$.
==

evaluator==
var('x')
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
L'intégrale vaut $! {{sol_tex}} !$.
==


