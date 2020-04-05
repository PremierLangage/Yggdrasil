extends = /model/mathinput.pl

title = Développement

before ==
var('x')

P = rand_int_poly(2,nc,3,x)
Q = rand_int_poly(2,nc,3,x)
sol = P * Q
==

text = Développer $$ {{P.latex}} \times {{Q.latex}}.$$

evaluator==
var('x')
score,numerror,feedback=eval_poly(input.value,sol,x)
==

