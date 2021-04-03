extends = /model/mathquill.pl

complex_form = cartesian

before ==
sol = sqrt(8)
==


evaluator ==
score, error = eval_expr(answers['math'], sol, checkratsimp=bool(checkratsimp))
feedback = message[error]
==

message.Solution ==
La solution est $! {{ sol|latex}} !$.
==

