# A MODIFIER

extends = /model/math/input.pl

checkratsimp = True

evaluator ==
from evalsympy import eval_interval
score, error = eval_interval(answers['math'], sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

