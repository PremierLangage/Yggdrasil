extends = /model/mathquill.pl

title = Calcul de dérivée

# Paramètres modifiables
lst_functions1 = [sin(x), cos(x), exp(x), ln(x)]
lst_functions2 = [x, x**2]
n = 4

before ==
var('x')
n = randint(1, int(n))
g = randitem(sympy(lst_functions1))
h = randitem(lsympy(lst_functions2))
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