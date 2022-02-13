extends = /model/math/expr2.pl

title = Calculer la distance entre deux points du plan

before == #|python|
# Créer champs de réponse
inputs = [MathInput(), MathInput()]
inputs[0].prefix = "Réponse 1 :"
inputs[0].sol = sqrt(2)
inputs[1].prefix = "Réponse 2 :"
inputs[1].sol = sqrt(3)
==

question == 
Entrer la racine de 2 et la racine de 3 ?
==

solution ==
La solution est ...
==

inputblock ==
{{ lstinput[0]|mathinput }}
{{ lstinput[1]|mathinput }}
==

evaluator ==
from functools import partial
def add_custom_eval(obj, func):
    'Bind a function and store it in an object'
    setattr(obj, "custom_eval", partial(func, obj))

def average(lst):
    return sum(lst)/len(lst)

test = lstinput[1].prefix
test2 = str(type(lstinput[0]))
#lstinput = [input1, input2]
from sympy import sympify
from evalsympy import eval_expr

def myeval(self):
    score0, error0 = eval_expr(self.value, self.sol, checkratsimp=checkratsimp, equality=equality, unauthorized_func=unauthorized_func, modulo=modulo, local_dict=sympify(symbol_dict))
    self.score = score0
    self.feedback = message[error0]

for input in []:
    input.value = answers[input.id]
    # add_custom_eval(input, myeval)
    input.eval()
    input.score = 0
    input.feedback = str(test2)
    input.display_feedback()

for input in lstinput:
    input.value = answers[input.id]
    # add_custom_eval(input, myeval)
    input.eval()
    input.score = 0
    input.feedback = str(test2)
    input.display_feedback()

score = 56

==

old ==

if -10 in [input.score for input in lstinput]:
    score = -1
    for input in lstinput:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()
elif 1==3:
    score = int(average([input.score for input in lstinput]))
    for input in lstinput:
        input.display_feedback()
==