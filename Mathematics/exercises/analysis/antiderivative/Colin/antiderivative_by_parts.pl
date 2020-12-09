extends = /model/mathinput.pl

title = Calcul d'une intégrale par intégration par parties

before ==
var('x') # crée le symbole x





S = [arctan(x),ln(x),x**2*cos(x),x**2*sin(x),x**2*exp(x)]

f = randitem(S)

sol = integrate(f,x) # Solution


==

text ==
Grâce à la formule d'intégration par parties, déterminer une primitive de la fonction définie par l'expression
$! {{f | latex}} !$.
==

evaluator ==
score, error = eval_function(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==





