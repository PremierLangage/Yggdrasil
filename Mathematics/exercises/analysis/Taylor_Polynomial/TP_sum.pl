extends = /model/mathinput.pl

title = Développer une expression polynomiale

before ==
var('x') # crée le symbole x
P(x) = randitem([exp(x), ln(1+x)])
Q(x) = randitem([cos(x), sin(x)])
P1 = P(x).series(x==0, 1)
Q1 = Q(x).series(x==0, 1)
expr_poly = P1*Q1 # version non développée
sol = (P1 * Q1).expand() # version développée
==

text ==
Développer $${{ expr_poly|latex }}.$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

