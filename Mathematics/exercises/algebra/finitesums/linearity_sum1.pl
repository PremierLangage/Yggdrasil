extends = /Mathematics/template/mathinput.pl

title = Linéarité


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])
varS=Symbol('S')
a=randint(1,4)
b0=randint(-4,4,[0])
b=n+b0
n0=max([0,a-b0])
S0 = Sum(v, (v, a, b))
p1,p2=list_randint_norep(2,-5,5,[0])
q1,q2=list_randint_norep(2,-5,5,[0])
c1,c2=list_randitem_norep(2,[randitem([-1,1]),randint(-3,3,[-1,1,0])])
E = c1*Sum(p1*v+q1, (v, a, b))+c2*Sum(p2*v+q2, (v, a, b))
S_tex=latex(S0)
E_tex=latex(E)
n_tex=latex(n)
sol=(c1*p1-c2*p2)*varS+(c1*q1-c2*q2)*(n+n0-a+1)
sol_tex=latex(sol)
==


text ==
On pose $! \displaystyle S = {{S_tex}} !$. Exprimer $% \displaystyle {{E_tex}} %$ en fonction de $! S !$ et $! n !$.
==

evaluator==
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==


