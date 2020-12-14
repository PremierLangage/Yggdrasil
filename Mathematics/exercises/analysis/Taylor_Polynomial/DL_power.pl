# Author : C. Petitjean.

extends = /model/mathinput.pl

title = Développement limité d'une puissance.

before ==
var('x') # crée le symbole x
n = 3 # Ordre du DL

a = randitem([i for i in range(-5,5) if i not in [0]])
S = [i for i in range(-4,4) if i not in [0,-1,1]]
m = randitem(S)

from fractions import*
p = Fraction(1,m)


PQ = (1+a*x)**(p)

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


