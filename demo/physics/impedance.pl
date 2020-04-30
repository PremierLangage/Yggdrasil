extends = /model/mathinput.pl

title = Calcul d'impédance

input.virtualKeyboards = electronics

before ==
var('R,L,omega', real=True, nonzero=True)
X1 = R + I * L * omega
X2 = R * R
sol = simplify(1/(1/X1 + 1/X2))
sol = R *(1 + R)
# h = expand_complex(X1/X2)
# h = X1/X2
# b = h.is_complex
b = srepr(sol)
c = srepr(str2expr("R(1+R)"),  local_dict={"i": I, "omega": omega, "R": R, "L": L}))
==

text ==
{{b}}
Quelle est l'impédance de R en parallèle avec R + L ?
$$ {{sol|latex}} $$
{{c}}
==

form ==
{{ input|component }}
==

evaluator ==
score = 0
ans = latex2sympy(input.value,  local_dict={"j": I, "omega": omega, "R": R, "L": L})
feedback = str(srepr(ans))
#score, _, feedback = eval_complex(input.value, sol, imaginary_unit="j",)
==

