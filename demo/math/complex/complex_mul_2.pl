extends = /model/math/expr2.pl

title = Calculer la distance entre deux points du plan

before == #|python|
z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
inputs = [MathInput(), MathInput()]
inputs[0].prefix = "Réponse 1 :"
inputs[0].sol = (z1 + z2).expand()
inputs[0].type = "complex"
inputs[1].prefix = "Réponse 2 :"
inputs[1].sol = (z1 - z2).expand()
inputs[1].type = "complex"
==

question == 
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. 
Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

solution ==
La solution est ...
==

inputblock ==
{{ inputs[0]|mathinput }}
{{ inputs[1]|mathinput }}
==

evaluator ==
from functools import partial
def add_custom_eval(obj, func):
    'Bind a function and store it in an object'
    setattr(obj, "custom_eval", partial(func, obj))

from mathinput import MathInput
MathInput.message = message

def average(lst):
    return sum(lst)/len(lst)

from sympy import sympify
from evalsympy import eval_expr

def myeval(self):
    score0, error0 = eval_expr(self.value, self.sol, checkratsimp=checkratsimp, equality=equality, unauthorized_func=unauthorized_func, modulo=modulo, local_dict=sympify(symbol_dict))
    self.score = score0
    self.feedback = message[error0]

for input in inputs:
    input.value = answers[input.id]
    # add_custom_eval(input, myeval)
    input.eval()
    input.display_feedback()

if -1 in [input.score for input in inputs]:
    score = -1
    for input in inputs:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()
else:
    score = int(average([input.score for input in inputs]))
    for input in inputs:
        input.display_feedback()
==
