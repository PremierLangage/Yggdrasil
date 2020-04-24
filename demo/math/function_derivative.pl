extends = /model/math.pl

title = Calcul de dérivée

input.virtualKeyboards = functions

before ==
var('x')
a = rd.choice([-1, 1]) * rd.choice([Rational(1, 2), Rational(1, 3), 2, 3])
b = rd.choice([Rational(1, 2), Rational(1, 3), 2, 3])
g = rd.choice([sin, cos, exp, ln])
f = a * g(b * x)
sol = diff(f, x)
==

text ==
Calculer la dérivée de la fonction
$$ f : x \mapsto {{f.latex}} .$$
==

evaluator ==
score, _, feedback = eval_function(input.value, sol)
==

