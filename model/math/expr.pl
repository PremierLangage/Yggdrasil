extends = /model/math/input.pl

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
equality = ""
modulo = null

evaluator ==
from ast import literal_eval
from sympy import sympify
from evalsympy import eval_expr
score, error = eval_expr(answers['math'], sol, checkratsimp=checkratsimp,equality=equality, unauthorized_func=unauthorized_func, local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex }} !$.
==
