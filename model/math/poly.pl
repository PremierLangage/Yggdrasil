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
from sympy import poly
poly_var = str(poly(sol).gen)
input.evalparam = {'var': poly_var, 'form': poly_form}
==