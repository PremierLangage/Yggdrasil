extends = /model/mathquill.pl

text =

before ==
sol = (1,3)
==

input_prefix = Réponse :

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

evaluator ==
from ast import literal_eval
from evalsympy import eval_tuple
score, error = eval_tuple(answers['math'], sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==
