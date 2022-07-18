# Author : C. Petitjean.

extends = /model/mathinput.pl

title = Développement limité d'un quotient.

before ==
var('x') # crée le symbole x
n = 3 # Ordre du DL

f = 1+rd.randint(-5, 5)*x + rd.randint(-5, 5)*x**2 + rd.randint(-5, 5)*x**3

S = [exp(x),ln(1+x),ln(1-x),cos(x),sin(x)]

P = randitem(S)
Q = randitem([f,exp(x),cos(x)])

PQ = P/Q
DLn = PQ.series(x,0,n+1) # Attention +1 sur l'ordre (notation O par défault).

sol = DLn.subs(O(x**(n+1)),0) # Solution

# Remarque générale : Sympy sait calculer avec les "O", mais je ne sais pas si il connait les "o"...
==

text ==
Calculer la partie régulière du développement limité à l'ordre $!{{ n |latex }}!$ en 0 de la fonction ci-dessous.
$${{ PQ|latex }}$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==



# Remarque : eval_expr(input.value, sol) est envisageable, mais l'évaluateur ne vérifie 
#            pas si la solution de l'étudiant est donnée sous forme simplifiée.

