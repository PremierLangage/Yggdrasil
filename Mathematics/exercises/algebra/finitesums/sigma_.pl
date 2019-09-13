extends = /Mathematics/template/mathexpr.pl

title = Symbole Sigma

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

v=randitem([Symbol('i'),Symbol('k')])
a=randint(*eval(param['range_init']))
b=a+randint(*eval(param['range_length']))
expr=randitem(eval(param['expr']))
S = Sum(expr, (v, a, b))
S_tex=latex(S)
sol=S.doit()
sol_tex=latex(sol)
==

text ==
Calculer $% \displaystyle {{S_tex}} %$.
==

evaluator==
score,_,feedback=ans_expr(input1.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==

