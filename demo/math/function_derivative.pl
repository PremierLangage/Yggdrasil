extends = /model/mathinput.pl

title = Calcul de dérivée

input.virtualKeyboards = functions

before ==
var('x')
a = randitem([-1,1])*randitem([Rational(1,2),Rational(1,3),2,3])
b = randitem([Rational(1,2),Rational(1,3),2,3])
g = randitem([sin, cos, exp, ln])
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

