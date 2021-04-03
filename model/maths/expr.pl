extends = /model/mathquill.pl

complex_form = cartesian

evaluator ==
score, error = eval_expr(answers['math'], sol)
feedback = message[error]
==

message.Solution ==
La solution est $! {{ sol|latex}} !$.
==

