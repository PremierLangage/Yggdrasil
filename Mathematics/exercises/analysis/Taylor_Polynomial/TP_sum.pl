extends = /model/mathinput.pl

title = Développer une expression polynomiale

before ==
var('x') # crée le symbole x
n = 3 # Ordre du DL
P = randitem([exp(x), ln(1+x)])
Q = randitem([cos(x), sin(x)])
P1 = P.series(x,0,n+1) # Attention +1 sur l'ordre (notation O par défault).
Q1 = Q.series(x,0,n+1) 
P2=P1.subs(O(x**(n+1)),0)
Q2=Q1.subs(O(x**(n+1)),0)
expr_poly = P2*Q2 # version non développée
sol = (P2 * Q2).expand() # version développée

# Remarque générale : Sympy sait calculer avec les "O", mais je ne sais pas si il connait les "o"...
==

text ==
Calculer la partie régulière du développement limité à l'ordre $!n!$ de la fonction ci-dessous $${{ expr_poly|latex }}.$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

