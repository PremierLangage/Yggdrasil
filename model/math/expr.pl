extends = /model/math/input.pl

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
equality = ""
modulo = 0

evaluator ==
from ast import literal_eval
from sympy import sympify
from evalsympy import eval_expr
if modulo != 0:
    modulo = sympify(modulo)
score, error = eval_expr(answers['math'], sol, checkratsimp=checkratsimp,equality=equality, unauthorized_func=unauthorized_func, modulo=modulo, local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex }} !$.
==
