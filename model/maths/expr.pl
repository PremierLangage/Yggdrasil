extends = /model/mathquill.pl

complex_form = cartesian

evaluator ==
checkratsimp = True
score, error = eval_expr(answers['math'], sol, checkratsimp=checkratsimp)
feedback = message[error]
==

message.Solution ==
La solution est $! {{ sol|latex}} !$.
==

