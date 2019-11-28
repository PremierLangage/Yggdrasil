extends = /Mathematics/template/mathinput.pl

title = Somme d'entiers successifs

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=Symbol('n')
a=randint(1,4)
b=n+randint(1?4)
S = Sum(v, (v, a, b))
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
