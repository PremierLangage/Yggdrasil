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