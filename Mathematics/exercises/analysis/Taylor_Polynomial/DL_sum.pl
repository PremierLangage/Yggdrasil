extends = /model/mathinput.pl

title = Développement limité d'une somme.

before ==
var('x') # crée le symbole x
n = 5 # Ordre du DL

f1=1/(1+x)
f2=1/(1-x)
# f3=1/(1+x**2) Provoque une ereur, je ne sais pas pourquoi...
f4=1/(1-x**2)


S = [exp(x),ln(1+x),ln(1-x),cos(x),sin(x),f1,f2,f4]

P = randitem(S)
Q = randitem([i for i in S if i not in [P]])


# La fonction ci-dessous est inutile maintenant, j'ai trouvé plus simple.
def my_custom_random():
    exclude=[0]
    randInt = randint(-5,5)
    return my_custom_random() if randInt in exclude else randInt

print(my_custom_random())

a = randitem([i for i in range(-5,5) if i not in [0]])
b = randitem([i for i in range(-5,5) if i not in [0]])



Som = a*P+b*Q
DLn = Som.series(x,0,n+1) # Attention +1 sur l'ordre (notation O par défault).

sol = DLn.subs(O(x**(n+1)),0) # Solution

# Remarque générale : Sympy sait calculer avec les "O", mais je ne sais pas si il connait les "o"...
==

text ==
Calculer la partie régulière du développement limité à l'ordre $!{{ n |latex }}!$ en 0 de la fonction ci-dessous.
$${{ Som|latex }}$$
Afficher $${{ a|latex }}$$ et $${{ b|latex }}$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==




