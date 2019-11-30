extends = sum_.pl

title = Somme d'entiers successifs

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])
if param['boundtype']==1:
    a=randint(1,4)
    b0=randint(-4,4,[0])
    b=n+b0
elif param['boundtype']==2:
    an,bn=randitem([(n,2*n),(2*n,3*n),(n,3*n),(n,4*n)])
    a0=randint(1,4)
    a=a0+an
    b0=randint(-4,4,[0])
    b=bn+b0
n0=int(max([0,max(solve(a-b,n))]))
S = Sum(v, (v, a, b))
S_tex=latex(S)
n_tex=latex(n)
sol=simplify((b-a+1)*(a+b)/2)
sol_tex=latex(sol)
==

text ==
Soit un entier $! {{n_tex}} \geq {{n0}} !$. Calculer $! \displaystyle {{S_tex}} !$.
==

