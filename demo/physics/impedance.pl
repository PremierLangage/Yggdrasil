# Cette commande importe le modèle d'exercice pour les maths
# En particulier, elle importe la bibliothèque SymPy 
# et d'autres bibliothèques qu'on a développés autour de SymPy
extends = /model/mathinput.pl

title = Calcul d'impédance

input.virtualKeyboards = electronics

before ==
var('R L C omega')
X1 = R + I * L * omega
X2 = R
sol = simplify(1/(1/X1 + 1/X2))
==

text ==
$$ {{sol|latex}} $$
==

form ==
{{ input|component }}
==

evaluator ==
score, _, feedback = eval_complex(input.value, sol, imaginary_unit="j", local_dict={"omega": omega})
==

