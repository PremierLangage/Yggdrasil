extends = /model/math/expr2.pl

title = Calculer la distance entre deux points du plan

before == #|python|
# Créer champs de réponse
input1 = MathInput()
input1.prefix = "Réponse 1 :"
input1.sol = sqrt(2)
input2 = MathInput()
input2.prefix = "Réponse 2 :"
input2.sol = sqrt(3)
sol = 0
lstinput = [input1, input2]
lsttest = [sqrt(2), sqrt(3)]
==

question == 
Entrer la racine de 2 et la racine de 3 ?
==

solution ==
La solution est ...
==

inputblock ==
{{ input1|mathinput }}
{{ input2|mathinput }}
==

evaluator ==
from functools import partial
def add_custom_eval(obj, func):
    'Bind a function and store it in an object'
    setattr(obj, "custom_eval", partial(func, obj))

def average(lst):
    return sum(lst)/len(lst)

test = lstinput[1].prefix
test2 = lstinput[0].sol
#lstinput = [input1, input2]
from sympy import sympify
from evalsympy import eval_expr

def myeval(self):
    score0, error0 = eval_expr(self.value, self.sol, checkratsimp=checkratsimp, equality=equality, unauthorized_func=unauthorized_func, modulo=modulo, local_dict=sympify(symbol_dict))
    self.score = score0
    self.feedback = message[error0]

for input in [input1, input2]:
    input.value = answers[input.id]
    # add_custom_eval(input, myeval)
    input.eval()
    input.score = 0
    input.feedback = str(test2)
    input.display_feedback()

lstinput[1].score = 0
lstinput[1].feedback = "toto"
lstinput[1].hide_feedback()


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