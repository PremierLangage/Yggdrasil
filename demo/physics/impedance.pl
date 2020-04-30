extends = /model/mathinput.pl
@ /model/latex_settings/latex_settings_electronics.py [latex_settings.py]

title = Calcul d'impédance

input.virtualKeyboards = electronics

before ==
var('R, L, omega', real=True, nonzero=True)
X1 = R + I * L * omega
X2 = R
sol = simplify(1/(1/X1 + 1/X2))
==

text ==
Quelle est l'impédance de R en parallèle avec R + L ?
Solution :
$$ {{sol|latex}} $$
==

evaluator ==
score, _, feedback = eval_complex(input.value, sol, imaginary_unit="j", local_dict={"omega": omega, "R": R, "L": L})
==

