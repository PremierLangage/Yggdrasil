extends = /model/mathquill.pl


before ==
# Script
==

input_prefix = Réponse :
imaginary_unit = i
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

evaluator ==
from ast import literal_eval
score, error = eval_complex(answers['math'], sol, imaginary_unit="i", form="", checkratsimp=literal_eval(checkratsimp), unauthorized_func=literal_eval(unauthorized_func), local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

