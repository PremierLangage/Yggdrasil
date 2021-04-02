extends = /model/mathquill.pl

title = Calcul de dérivée

lst_functions = [sin(x), cos(x), exp(x), ln(x)]

before ==
var('x')
n = randint(1, 4)
g = randitem(lst_functions)
h = randitem([x, x**2])
f = n*g*h
sol = diff(f,x)
==

text ==
Calculer la dérivée de la fonction
$$ f : x \mapsto {{f|latex}} .$$
==

evaluator ==
score, error = eval_function(answers['math'], sol)
feedback = message[error]
==

# message.NotEqual = Toto
# message.NotExpr = On comprend rien !


solution ==
La dérivée est la fonction
$$ x \mapsto {{sol|latex}} .$$
==