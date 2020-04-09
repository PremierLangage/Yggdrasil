extends = /model/mathinput.pl

title = Développement d'une expression polynomiale

before ==
keyboards_JSON['virtualKeyboards'] = "elementary"
input.config = keyboards_JSON

var('x')
P = rand_int_poly(1, 2, 5, x)
Q = rand_int_poly(1, 2, 5, x)
expr = P * Q
==

text = Développer $${{expr.latex}}.$$

evaluator==
score, _, feedback = eval_poly(input.value, expr, var="x", form="expanded")
==


