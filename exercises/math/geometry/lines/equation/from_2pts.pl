extends = equation_.pl

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