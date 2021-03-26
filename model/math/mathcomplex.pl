extends = /model/mathquill.pl

form_complex = cartesian

evaluator ==
score, error = eval_complex(answers['math'], sol, form=complex_form)
feedback = message[error]
==

message.Solution ==
La solution est $! {{ sol|latex}} !$.
==
