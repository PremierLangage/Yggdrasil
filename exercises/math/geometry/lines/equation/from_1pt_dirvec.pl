extends = equation_.pl

before ==
from sympy import Line
xA, yA = randint(-3, 3), randint(-3, 3)
while True:
    vx, vy = randint(-3, 3), randint(-3, 3)
    if (vx, vy) != (0, 0):
        break

line = Line((xA, yA), (xA+vx, yA+vy))  
sol = line.equation()
==

question ==
Déterminer une équation de la droite passant par le point $! ({{xA}}, {{yA}}) !$ et ayant pour vecteur directeur $! ({{vx}}, {{vy}}) !$.
==
