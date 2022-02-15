# Model for a single math input field
# with an evaluation as a finite set

extends = /model/math/input2.pl

# Evaluation parameters
input_type = "set"
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
wobracket = False


evalparam ==
from sympy import sympify
input.evalparam = {'wobracket': wobracket, 'checkratsimp': checkratsimp, 'unauthorized_func': unauthorized_func, 'local_dict': sympify(symbol_dict)}
==