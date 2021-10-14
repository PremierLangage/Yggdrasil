# Author : C. Petitjean.

extends = /model/math/mathinput.pl

title = Développement limité et changement de variable.

before ==
var('x') # crée le symbole x
n = 4 # Ordre du DL


S = [-x,x**2,-x**2,x**3,-x**3,x**4,-x**4]
Rand = randitem(S)
a = randitem([i for i in range(1,5)])
P = a*Rand

f1=1/(1+P)
f2=1/(1-P)


S1 = [exp(P),ln(1+P),ln(1-P),cos(P),sin(P),f1,f2]
Q = randitem(S1)

PQ = Q


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




