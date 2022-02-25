extends = /model/math/input.pl

title = Symbole Sigma

before ==
v=randitem([Symbol('i'),Symbol('k')])
a=randint(*eval(param['range_init']))
b=a+randint(*eval(param['range_length']))
expr=randitem(eval(param['expr']))
S = Sum(expr, (v, a, b))
sol = S.doit()
==

question ==
Calculer $! \displaystyle {{S|latex}} !$.
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{sol|latex}} !$.
==





