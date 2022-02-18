extends = /model/math/expr.pl
@ /utils/exercises/exmath.py
@ /utils/inputfields/mathinput.py

tplpage =@ /model/math/template3.html

title = Calculer la distance entre deux points du plan

before == #|python|
from exmath import ExMath
ex = ExMath()
ex.question = question
ex.input.sol = sqrt(3)
ex.solution = solution
# Créer champs de réponse
#inputblock = input.render()
ex.inputblock = ex.input.render()
==

evaluator ==
ex.input.value = answers[ex.input.id]
ex.input.eval()
ex.input.display_feedback()
score = ex.input.score
ex.inputblock = ex.input.render()
==

question == 
{{ex}}
==

solution ==
La solution est ...
==

inputblock ==

==
