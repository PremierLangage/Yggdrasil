extends = /model/math/expr.pl

title = Déterminer une équation d'une droite

before ==
var('x')
while True:
    xA, yA = randint(-5, 5), randint(-5, 5)
    xB, yB = randint(-5, 5), randint(-5, 5)
    if (xA, yA) != (xB, yB):
        break

line = Line((xA, yA), (xB, yB))  
sol = Line.equation()
==

question ==
Déterminer une équation de la droite passant par $! ({{xA}}, {{yA}}) !$ et $! ({{xB}}, {{yB}}) !$.
==

evaluator ==
import sympy as sp
from evalsympy import equal, is_rat_simp
from latex2sympy import latex2sympy

def eval_ans(strans, sol):
    try:
        p = strans.split('=')
        if len(p) != 2:
            return (-1, "NotEq")
        ans = sp.Eq(latex2sympy(p[0]), latex2sympy(p[0]))
    except:
        return (-1, "NotEq")
    try:
        ans = sp.Line(ans)
    except:
        return (-1, "NotLineEq")
    return (100, "Success")

score, error = eval_ans(inputfield.value, sol)
feedback = message[error]

==

message.NotEq = "La réponse doit être une équation."

message.NotLinEq = "La réponse n'est pas une équation de droite."