extends = /model/mathinput.pl

title = Calcul d'une intégrale par intégration par parties

before ==
var('x') # crée le symbole x



c = randitem([i for i in range(2,10)])


S = [x*exp(c*x),x*ln(c*x),x*cos(c*x),x*sin(c*x)]

f = randitem(S)


if f==x*exp(c*x):
    a=0
    b=1/c
elif f==x*ln(c*x):
    a=1/c 
    b= exp(1)/c
elif f==x*cos(c*x):
    a=-pi/(2*c) 
    b= pi/(2*c)
elif f==x*sin(c*x):
    a=0 
    b= pi/c

sol = integrate(f,(x,a,b)) # Solution



==

text ==
Grâce à la formule d'intégration par partiesn calculer l'intégrale  
$$ \int_{ {{a | latex }} }^{ {{b | latex }} } {{f | latex}} \mathrm dx $$ 
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==




