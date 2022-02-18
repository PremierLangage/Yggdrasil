extends = /model/math/expr.pl
@ /utils/exercises/exmath.py
@ /utils/inputfields/mathinput.py

title = Calculer la distance entre deux points du plan

before == #|python|
from exmath import ExMath
ex = ExMath()
ex.input.sol = sqrt(3)
ex.input.value = 3
# Créer champs de réponse
#inputblock = input.render()
==

evaluator ==
ex.input.eval()
ex.input.display_feedback()
score = ex.input.score
#inputblock = input.render()
==

question == 
Entrer la racine de 2 et la racine de 3 ?
==

solution ==
La solution est ...
==

inputblock ==
<div style="display: block; margin-top: 1em;">
{{ ex.input|mathinput }}
toto
</div>
==
