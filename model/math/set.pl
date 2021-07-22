extends = /model/math/input.pl

input_prefix = Réponse :

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

evaluator ==
from ast import literal_eval
from evalsympy import eval_set
score, error = eval_set(answers['math'], sol, wobracket=wobracket, local_dict=local_dict)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==