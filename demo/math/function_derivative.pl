extends = /model/mathinput.pl

title = Calcul de dérivée

input.virtualKeyboards = functions

before ==
var('x')
g = randitem([sin(x), cos(x), exp(x), ln(x)])
h = randitem([x, x**2])
g = exp(x)
f = g * h
sol = diff(f, x)
==

text ==
Calculer la dérivée de la fonction
$$ f : x \mapsto {{f.latex}} .$$
==

evaluator ==
score, _, feedback = eval_expr(input.value, sol)
==

