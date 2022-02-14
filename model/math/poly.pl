# Model for a single math input field
# with an evaluation as a polynom

extends = /model/math/input2.pl

# Evaluation parameters
input_type = "poly"
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
poly_form =
poly_domain = R

evalparam ==
from sympy import sympify
if modulo != 0:
    modulo = sympify(modulo)
input.evalparam = {'var': poly_var, 'form': poly_form}
==




evaluator ==
from ast import literal_eval
from evalsympy import eval_poly
from sympy import poly
poly_var = str(poly(sol).gen)
score, error = eval_poly(answers['math'], sol, var=poly_var, form=poly_form)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==
