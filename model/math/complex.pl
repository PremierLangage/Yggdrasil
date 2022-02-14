# Model for a single math input field
# with an evaluation as a complex number

extends = /model/math/input2.pl

# Evaluation parameters
input_type = "complex"
input_prefix = Réponse :
imaginary_unit = i
complex_form = 
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

# Latex settings
latexsettings.imaginary_unit = i

evalparam ==
from sympy import sympify
input.evalparam = {'imaginary_unit': imaginary_unit, 'form': complex_form, 'checkratsimp': checkratsimp, 'unauthorized_func': unauthorized_func, 'local_dict': sympify(symbol_dict)}
==