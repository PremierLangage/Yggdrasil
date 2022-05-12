extends = /model/math/input_eval.pl

title = Déterminer une équation d'une droite

before ==
from sympy import Line
var('x')
while True:
    xA, yA = randint(-3, 3), randint(-3, 3)
    xB, yB = randint(-3, 3), randint(-3, 3)
    if (xA, yA) != (xB, yB):
        break

line = Line((xA, yA), (xB, yB))  
sol = line.equation()
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
        ans = sp.Eq(latex2sympy(p[0]), latex2sympy(p[1]))
    except:
        return (-1, "NotEq")
    try:
        ans = sp.Line(ans)
    except:
        return (0, "NotLineEq")
    if not sp.Line(sp.Eq(sol,0)).equals(ans):
        return (0, str(ans.equation())+str(sp.Line(sp.Eq(sol,0)).equation()))
    return (100, "Success")

score, error = eval_ans(input.value, sol)
feedback = message[error]
==

solution ==
Une équation de cette droite est : $${{ sol|latex }} = 0.$$
==

message.NotEq = "La réponse doit être une équation."
message.NotLineEq = "La réponse n'est pas une équation de droite."
