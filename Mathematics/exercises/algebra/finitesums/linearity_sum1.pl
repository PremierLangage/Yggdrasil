extends = /Mathematics/template/mathinput.pl

title = Linéarité


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])
a=randint(1,4)
b0=randint(-4,4,[0])
b=n+b0
n0=max([0,a-b0])
S = Sum(v, (v, a, b))
E = 2*Sum(3*v+1, (v, a, b))+(-1)*Sum(v+1, (v, a, b))
E_tex=latex(S)
n_tex=latex(n)
sol=(b-a+1)*(a+b)/2
sol_tex=latex(sol)
==


text ==
On pose $! S = {{S_tex}} !$.

Exprimer $% \displaystyle {{S_tex}} %$ en fonction de $! S !$ et $! n !$.
==

evaluator==
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==


