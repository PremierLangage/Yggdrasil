extends = /Mathematics/template/mathinput.pl

title = Calcul d'intégrales

text ==
Calculer l'intégrale $! \displaystyle \int_{ {{x0}} }^{ {{x1}} } {{f_tex}} \, dx !$.
==

evaluator==
var('x')
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
L'intégrale vaut $! {{sol_tex}} !$.
==

