extends = /model/mathinput.pl

title = Calcul d'une intégrale par intégration par parties

before ==
var('x') # crée le symbole x



c = randitem([i for i in range(2,10)])


S = [x*exp(c*x),x*ln(c*x),x*cos(c*x),x*sin(c*x)]

f = randitem(S)


if f==x*exp(c*x):
    a=0
    b=frac(Rational(1, c))
elif f==x*ln(c*x):
    a=frac(Rational(1, c)) 
    b=exp(1)*frac(Rational(1, c))
elif f==x*cos(c*x):
    a=-pi * frac(Rational(1, 2*c)) 
    b= pi * frac(Rational(1, 2*c)) 
elif f==x*sin(c*x):
    a=0 
    b= pi*frac(Rational(1, c)) 

sol = integrate(f,(x,a,b)) # Solution



==

text ==
Grâce à la formule d'intégration par parties, calculer l'intégrale  
$$ \int_{ {{a | latex }} }^{ {{b | latex }} } {{f | latex}} \mathrm dx $$ 
$$ {\color{red} \text{Vous devez taper exp(1) à la place de e}}$$
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==




