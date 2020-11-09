extends = /model/mathinput.pl

title = Model : fraction

evaluator==
score, error = eval_frac(input.value, sol)
feedback = message[error]
==

solution==
La solution est $! \displaystyle {{ sol|latex }} !$.
==

