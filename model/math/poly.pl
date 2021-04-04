extends = /model/mathquill.pl

before ==
P = randint_poly(1, 2, 2)
Q = randint_poly(1, 2, 2)
expr = P * Q
sol = expr.expand()
==

text ==
Développer $${{expr|latex}}.$$
==

evaluator==
from ast import literal_eval
from evalsympy import eval_poly
score, error = eval_poly(answers['math'], sol, var=poly_var, form=poly_form)
feedback = message[error]
==

input_prefix = Réponse :
poly_var = x
poly_form = 
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

solution ==
La solution est $! {{ sol|latex}} !$.
==
