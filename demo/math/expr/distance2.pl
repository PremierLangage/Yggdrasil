extends = /model/math/expr2.pl

title = Calculer la distance entre deux points du plan

before ==
input1 = MathInput()
input1.prefix = "Réponse 1 :"
input2 = MathInput()
input2.prefix = "Réponse 1 :"
xA = randint(-5, 5)
yA = randint(-5, 5)
xB = randint(-5, 5)
yB = randint(-5, 5)
sol = sqrt((xA-xB)**2 + (yA-yB)**2)
==

question == 
Dans le plan muni d'un repère orthonormé on considère les points de coordonnées 
$! {{ (xA, yA) }} !$ et $! {{ (xB, yB) }}. !$
<br>
Quelle est la distance entre ces deux points ?
==

inputblock ==
{{ input1|mathinput }}
{{ input2|mathinput }}
==

evaluator ==
from sympy import sympify
from evalsympy import eval_expr
scores = []
errors = []
lstinput = [input1, input2]
for input in [input1, input2]:
    input.value = answers[input.id]
    score0, error0 = eval_expr(input.value, sol, checkratsimp=checkratsimp,equality=equality, unauthorized_func=unauthorized_func, modulo=modulo, local_dict=sympify(symbol_dict))
    input.score = score0
    input.feedback = message[error0]

if -1 in [input.score for input in lstinput]:
    score = -1
    for input in lstinput:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()
else:
    score = 3
    input.display_feedback()
==