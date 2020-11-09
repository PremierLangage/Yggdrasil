# Author : D. Doyen
# 9/11/2020

extends = /model/mathinput.pl

title = Model : Finite Sets

input.virtualKeyboards = sets

evaluator ==
score, error = eval_set(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! { {{sol|latex}} } !$.
==
