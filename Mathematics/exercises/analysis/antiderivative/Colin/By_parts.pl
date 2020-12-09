extends = /model/mathinput.pl

title = Calcul d'une intégrale par intégration par parties

before ==
var('x') # crée le symbole x



c = randitem([i for i in range(2,10)])


S = [exp(c*x),ln(c*x),cos(c*x),sin(c*x)]

f = randitem(S)


if f==exp(c*x):
    a=0
    b=1/c
elif f==ln(c*x):
    a=1/c 
    b= exp(1)/c
elif f==cos(c*x):
    a=-pi/(2*c) 
    b= pi/(2*c)
elif f==sin(c*x):
    a=0 
    b= pi/c

sol = integrate(f,(x,a,b)) # Solution

a1 = {{a | latex }}
b1 = {{b | latex }}
==

text ==
Grâce à la formule d'intégration par partiesn calculer l'intégrale  
$$ \int_{a1}^{b1} {{f | latex}} \mathrm dx $$ 
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==




