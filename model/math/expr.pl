extends = /model/mathquill.pl

complex_form = cartesian

before ==
sol = E
==


checkratsimp % false
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

evaluator ==
score, error = eval_expr(answers['math'], sol, checkratsimp=checkratsimp, unauthorized_func=eval(unauthorized_func), local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

