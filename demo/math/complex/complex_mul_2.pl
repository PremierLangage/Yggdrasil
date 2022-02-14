extends = /model/math/multinput.pl

title = Calculer la distance entre deux points du plan

before == #|python|
z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
inputs = [MathInput(), MathInput()]
inputs[0].prefix = "Réponse 1 :"
inputs[0].sol = (z1 + z2).expand()
inputs[0].type = "complex"
inputs[1].prefix = "Réponse 2 :"
inputs[1].sol = (z1 - z2).expand()
inputs[1].type = "complex"
==

question == 
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. 
Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

solution ==
La solution est  {{z1|latex}}
==
