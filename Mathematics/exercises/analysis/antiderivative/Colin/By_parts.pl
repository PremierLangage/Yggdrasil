extends = /model/mathinput.pl

title = Calcul d'une intégrale par intégration par parties

before ==
var('x') # crée le symbole x



c = randitem([i for i in range(2,10)])


S = [exp(c*x),ln(c*x),cos(c*x),sin(c*x)]

f = randitem(S)

a=1
b=2

if f=="exp(c*x)":
    a=0
    b=1/c
elif f=="ln(c*x)":
    a=1/c 
    b= exp(1)/c
elif f=="cos(c*x)":
    a=-pi/(2*c) 
    b= pi/(2*c)
elif f=="sin(c*x)":
    a=0 
    b= pi/c

sol = integrate(f,(x,a,b)) # Solution



==

text ==
Calculer l'intégrale $!{{ \int_a^b f \mathrm dx |latex }}!$  grâce à la formule d'intégration par parties.
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==




