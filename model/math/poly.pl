extends = /model/mathquill.pl

before ==
P = rand_int_poly(1, 2, 2, "x")
Q = rand_int_poly(1, 2, 2, "x")
expr = P * Q
sol = exp.expand()
==

text ==
Développer $${{expr|latex}}.$$
==

evaluator==
from ast import literal_eval
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
