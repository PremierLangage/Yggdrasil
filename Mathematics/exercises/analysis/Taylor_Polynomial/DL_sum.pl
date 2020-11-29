extends = /model/mathinput.pl

title = Développement limité d'une somme.

before ==
var('x') # crée le symbole x
n = 5 # Ordre du DL

f1=1/(1+x)
f2=1/(1-x)
# f3=1/(1+x**2) Provoque une ereur, je ne sais pas pourquoi...
f4=1/(1-x**2)

P = randitem([exp(x),ln(1+x),ln(1-x),cos(x),sin(x),f1,f2,f4])
Q = randitem([exp(x),ln(1+x),ln(1-x),cos(x),sin(x),f1,f2,f4])


def my_custom_random():
    exclude=[0]
    randInt = randint(-5,5)
    return my_custom_random() if randInt in exclude else randInt

print(my_custom_random())

a = my_custom_random()
b = my_custom_random()

from random import choice

c = print choice([i for i in range(0,9) if i not in [2,5,7]])

Som = a*P+c*Q
DLn = Som.series(x,0,n+1) # Attention +1 sur l'ordre (notation O par défault).

sol = DLn.subs(O(x**(n+1)),0) # Solution

# Remarque générale : Sympy sait calculer avec les "O", mais je ne sais pas si il connait les "o"...
==

text ==
Calculer la partie régulière du développement limité à l'ordre $!{{ n |latex }}!$ en 0 de la fonction ci-dessous.
$${{ Som|latex }}$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==



