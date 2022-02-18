extends = /model/math/expr.pl

title = Calculer la distance entre deux points du plan

before == #|python|
# Créer champs de réponse
input = MathInput
input.sol = sqrt(3)
==

question == 
Entrer la racine de 2 et la racine de 3 ?
==

solution ==
La solution est ...
==

inputblock ==
{{ inputs[0]|mathinput }}
{{ inputs[1]|mathinput }}
==
