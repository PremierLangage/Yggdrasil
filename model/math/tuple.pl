# Model for a single math input field
# with an evaluation as a tuple
extends = /model/math/input.pl

# Evaluation parameters
input_type = "tuple"
checksize = False
symbol_dict = {'e': E}

evalparam ==
from sympy import sympify
input.evalparam = {'checksize':checksize, 'local_dict': sympify(symbol_dict)}
==