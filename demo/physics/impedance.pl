extends = /model/mathinput.pl

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
Indice : c'est
$$ {{sol|latex}} $$
==

form ==
{{ input|component }}
==

evaluator ==
score, _, feedback = eval_complex(input.value, sol, imaginary_unit="j", local_dict={"j": I, "omega": omega, "R": R, "L": L})
==

