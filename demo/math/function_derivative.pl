extends = /model/mathinput.pl

title = Calcul de dérivée

before ==
var('x')
n=randint(1,4)
g=randitem([sin(x),cos(x),exp(x),ln(x)])
h=randitem([x,x**2])
f=g*h
sol=diff(f,x)
==

text ==
Calculer la dérivée de la fonction
$$ f : x \mapsto {{f.latex}} .$$
==

evaluator ==
score, _, feedback=eval_expr(input.value, sol)
==

