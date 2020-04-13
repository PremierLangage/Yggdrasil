extends = /model/mathinput.pl

text ==
Soit un entier $! {{n_tex}} \geq {{n0}} !$. Calculer $! \displaystyle {{S_tex}} !$.
==

evaluator==
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==


