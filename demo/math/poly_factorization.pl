extends = /model/mathinput.pl

title = Factorisation d'une expression polynomiale

before ==
P = rand_int_poly(1, 2, 2, "x")
Q = rand_int_poly(1, 2, 2, "x")
expr = -1 - 3* x **2
==

text ==
Factoriser $${{ expr.latex }}.$$
==

evaluator==
score, _, feedback = eval_poly(input.value, expr, var="x", form="factorized")
==
