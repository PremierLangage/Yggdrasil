extends = /model/mathinput.pl

title = Développer une expression polynomiale

before ==
var('x') # crée le symbole x
P = rd.randint(-5, 5) + rd.randint(-5, 5)*x
Q = rd.randint(-5, 5) + rd.randint(-5, 5)*x
expr_poly = P*Q # version non développée
sol = (P * Q).expand() # version développée
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


# Remarque : eval_expr(input.value, sol) est envisageable, mais l'évaluateur ne vérifie 
#            pas si la solution de l'étudiant est donnée sous forme simplifiée.
