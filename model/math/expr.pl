extends = /model/mathquill.pl

complex_form = cartesian

before ==
sol = E
==


checkratsimp % false
symbol_dict = {'e': E}
authorized_func = [sin]

evaluator ==
score, error = eval_expr(answers['math'], sol, checkratsimp=checkratsimp, authorized_func=sympify(authorized_func), local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

