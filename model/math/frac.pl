# A MODIFIER

extends = /model/math/input.pl


evaluator ==
from ast import literal_eval
from evalsympy import eval_frac
score, error = eval_frac(answers['math'], sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

