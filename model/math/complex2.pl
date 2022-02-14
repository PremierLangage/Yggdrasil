# Model for single math input field
# with evaluation as a complex number
# (using MathInput class)

extends = /model/math/input.pl

# Evaluation parameters
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
input.eval()
score = input.score
input.display_feedback()
if score >=0:
    input.disable()
==

evaluator ==
from ast import literal_eval
from sympy import sympify
from evalsympy import eval_complex
score, error = eval_complex(answers['math'], sol, imaginary_unit=imaginary_unit, form=complex_form, checkratsimp=checkratsimp, unauthorized_func=unauthorized_func, local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

