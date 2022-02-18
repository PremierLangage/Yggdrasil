extends = /model/math/expr.pl
@ /utils/exercises/exmath.py
@ /utils/inputfields/mathinput.py

title = Calculer la distance entre deux points du plan

before == #|python|
# Créer champs de réponse
input = MathInput()
input.sol = sqrt(3)
inputblock = input.render()
==

evaluator ==
input.eval()
score = input.score
==

question == 
Entrer la racine de 2 et la racine de 3 ?
==

solution ==
La solution est ...
==

