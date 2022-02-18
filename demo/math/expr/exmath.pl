extends = /model/math/expr.pl
@ /utils/exercises/exmath.py
@ /utils/inputfields/mathinput.py

title = Calculer la distance entre deux points du plan

before == #|python|
from exmath import ExMath
ex = ExMath()

# Créer champs de réponse
input = MathInput()
input.sol = sqrt(3)
input.value = "3"
#inputblock = input.render()
==

evaluator ==
input.eval()
input.display_feedback()
score = input.score
inputblock = input.render()
==

question == 
Entrer la racine de 2 et la racine de 3 ?
==

solution ==
La solution est ...
==

inputblock ==
<div style="display: block; margin-top: 1em;">
{{ input|mathinput }}
toto
</div>
==
