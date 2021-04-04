extends = /model/mathquill.pl


input_prefix = Réponse :

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

evaluator ==
from ast import literal_eval
from evalsympy import eval_expr
score, error = eval_expr(answers['math'], sol, checkratsimp=literal_eval(checkratsimp), unauthorized_func=literal_eval(unauthorized_func), local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

