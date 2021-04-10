extends = /model/math/input.pl

checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
poly_var = 
poly_form = 
poly_domain = R

title =

before ==
from randsympy import randint_poly
P = randint_poly(1, 2, 2)
Q = randint_poly(1, 2, 2)
expr = (P * Q).expand()
sol = expr.expand()
==

text ==
Développer $$ {{ expr|latex }}.$$
==

evaluator==
from ast import literal_eval
from evalsympy import eval_poly
score, error = eval_poly(answers['math'], sol, var=poly_var, form=poly_form)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==
