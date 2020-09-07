extends = /model/mathinput.pl

title = Factorisation d'un polynôme quadratique

before ==
a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint_norep(2,-6,6,[0])
var('x')
f=a*x+b
if param['roots']=='int':
    P=(x+b)*(x+d)
if param['roots']=='intrat':
    P=(x+b)*(c*x+d)
if param['roots']=='rat':
    P=(a*x+b)*(c*x+d)
P=expand(P)
sol=factor(P)
==


text ==
Factoriser le polynôme $$ {{ P|latex }}. $$
==


evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="factorized")
feedback = message[error]
==

solution ==
Une factorisation de cette expression est $! {{ sol|latex }} !$.
==



