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