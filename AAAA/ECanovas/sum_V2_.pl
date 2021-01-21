extends = /model/mathinput.pl

text ==
Soit un entier $! {{n|latex}} \geq {{n0}} !$. Calculer $! \displaystyle {{S|latex}} !$.
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==


solution ==
La solution est $! {{sol|latex}} !$.

{{rappels}}
==
