# Author: D. Doyen
# Tags: complex numbers
# 19/8/2020

extends = /model/mathinput.pl

title = Opération sur les nombres complexes

form_complex = cartesian

input.virtualKeyboards = complex

evaluator ==
score, error = eval_complex(input.value, sol, form=complex_form)
feedback = message[error]
==

message.Solution ==
La solution est $! {{ sol|latex}} !$.
==
