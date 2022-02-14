# Model for single math input field
# with evaluation as a complex number
# (using MathInput class)

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

evaluator ==
from mathinput import MathInput
MathInput.message = message

input.value = answers[input.id]
input.sol = sol
input.eval()
score = input.score
input.display_feedback()
if score >=0:
    input.disable()
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

