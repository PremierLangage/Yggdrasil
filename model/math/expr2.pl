# Model for a single math input field
# with an evaluation as an expression

extends = /model/math/input2.pl

# Evaluation parameters
input_type = "expr"
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
equality = ""
modulo = 0

evalparam ==
from sympy import sympify
if modulo != 0:
    modulo = sympify(modulo)
input.evalparam = {'equality': equality, "modulo': modulo, 'checkratsimp': checkratsimp, 'unauthorized_func': unauthorized_func, 'local_dict': sympify(symbol_dict)}
==