extends = /model/mathquill.pl

complex_form = cartesian

before ==
sol = sqrt(8)
==


checkratsimp % false
symbol_dict = {'e': E}

evaluator ==
score, error = eval_expr(answers['math'], sol, checkratsimp=checkratsimp, local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

