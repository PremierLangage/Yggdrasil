extends = /model/mathinput.pl

form_complex = cartesian

input.virtualKeyboards = complex

evaluator ==
score, error = eval_complex(input.value, sol, form=complex_form)
feedback = message[error]
==

message.Solution ==
La solution est $! {{ sol|latex}} !$.
==
