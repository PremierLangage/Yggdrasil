extends = /model/mathinput.pl

title = Symbole Sigma

before ==
v=randitem([Symbol('i'),Symbol('k')])
a=randint(*eval(param['range_init']))
b=a+randint(*eval(param['range_length']))
expr=randitem(eval(param['expr']))
S = Sum(expr, (v, a, b))
S_tex=latex(S)
sol = S.doit()
==

text ==
Calculer $! \displaystyle {{S.latex}} !$.
==

evaluator==
score,_,feedback=eval_expr(input.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==



