# Cette commande importe le modèle d'exercice pour les maths
# En particulier, elle importe la bibliothèque SymPy 
# et d'autres bibliothèques qu'on a développés autour de SymPy
extends = /model/mathinput.pl

title = Calcul d'impédance

input.virtualKeyboards = electronics

before ==
# I et la méthode expand, c'est du SymPy
z1 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
z2 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
sol = (z1 * z2).expand()
==

text ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

form ==
{{ input|component }}
==

evaluator ==
score, _, feedback = eval_complex(input.value, sol)
==

