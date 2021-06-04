extends = /model/math/set.pl

title = Déterminer l'intersection de deux ensembles

before ==
from sympy import Intersection
A = FiniteSet(*sample(range(10), randint(3, 5)))
B = FiniteSet(*sample(range(10), randint(3, 5)))
sol = Intersection(A, B)
==

question ==
On considère les ensembles suivants : $$ A= {{ A|latex }},\ B={{B|latex}}.$$ 

Déterminer $! A \cap B !$.
==

# keypad % [{"label": "$! \\emptyset !$", "action": "cmd", "value": "\\empty"}]

keypad % [{"label": "$! +\\infty !$", "action": "write", "value": "\\operatorname{Vv}"}, {"label": "$! -\\infty !$", "action": "write", "value": "-\\infty"}]