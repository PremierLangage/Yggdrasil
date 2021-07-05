extends = /model/math/input.pl

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
poly_form =
poly_domain = R

title =


evaluator==
from ast import literal_eval
from evalsympy import eval_poly
poly_var = poly(sol).gen
score, error = eval_poly(answers['math'], sol, var=poly_var, form=poly_form)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==
