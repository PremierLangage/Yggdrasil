extends = /model/math/input.pl

input_prefix = Réponse :

imaginary_unit = i
complex_form = 
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

evaluator ==
from ast import literal_eval
from sympy import sympify
from evalsympy import eval_complex
score, error = eval_complex(answers['math'], sol, imaginary_unit=imaginary_unit, form=complex_form, checkratsimp=checkratsimp, unauthorized_func=unauthorized_func, local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

