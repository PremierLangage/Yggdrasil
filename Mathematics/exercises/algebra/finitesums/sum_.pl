extends = /Mathematics/template/mathinput.pl


text ==
Calculer $% \displaystyle {{S_tex}} %$.
==

evaluator==
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==

