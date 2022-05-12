extends = equation_.pl

before ==
from sympy import Line
xA, yA = randint(-3, 3), randint(-3, 3)
while True:
    xB, yB = randint(-3, 3), randint(-3, 3)
    if (xA, yA) != (xB, yB):
        break

line = Line((xA, yA), (xB, yB))  
sol = line.equation()
==

question ==
Déterminer une équation de la droite passant par le point $! ({{xA}}, {{yA}}) !$ et ayant pour vecteur directeur $! ({{vx}}, {{vy}}) !$.
==
