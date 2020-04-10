extends = /model/mathinput.pl

title = Développement d'une expression polynomiale

before ==
keyboards_JSON['virtualKeyboards'] = "elementary"
input.config = keyboards_JSON

P = rand_int_poly(1, 2, 2, "x")
Q = rand_int_poly(1, 2, 2, "x")
expr = P * Q
==

text ==
Développer $${{expr.latex}}.$$
==

evaluator==
score, _, feedback = eval_poly(input.value, expr, var="x", form="expanded")
==


