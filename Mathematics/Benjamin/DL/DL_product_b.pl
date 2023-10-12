# Author : C. Petitjean.

extends = /model/mathinput.pl

title = Développement limité d'un produit.

before ==
var('x') # crée le symbole x
n = 5 # Ordre du DL

f1=1/(1+x)
f2=1/(1-x)
f3=1/(1+x**2)
f4=1/(1-x**2)

S = [exp(x),ln(1+x),ln(1-x),cos(x),sin(x),f1,f2,f3,f4]

P = randitem(S)
Q = randitem(S)

PQ = P*Q
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

