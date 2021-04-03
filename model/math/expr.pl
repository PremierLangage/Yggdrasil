extends = /model/mathquill.pl

complex_form = cartesian

before ==
sol = sqrt(8)
==


checkratsimp % false

evaluator ==
score, error = eval_expr(answers['math'], sol, checkratsimp=checkratsimp)
feedback = message[error]
==

message.Solution ==
La solution est $! {{ sol|latex}} !$.
==

