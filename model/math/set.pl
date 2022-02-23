# Model for a single math input field
# with an evaluation as a finite set

extends = /model/math/input.pl

# Evaluation parameters
input_type = "set"
checkratsimp = True
symbol_dict = {'e': E}
wobracket = False


evalparam ==
from sympy import sympify
input.evalparam = {'wobracket': wobracket, 'checkratsimp': checkratsimp, 'local_dict': sympify(symbol_dict)}
==