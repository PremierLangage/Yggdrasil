extends = /model/mathinput.pl

title = 

before ==
# crée le symbole x
var('x')
# crée des polynômes aléatoires avec des paramètres donnés (degré, 
# nombre de coeff, borne sur les coeff, indéterminée)
# c'est une fonction qu'on a créé dans une bibli randsympy
#P = rand_int_poly(2, 2, 5, x)
#Q = rand_int_poly(3, 2, 5, x)
#expr = P * Q
#sol = (expr).expand()
==

text ==
Développer 
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==
