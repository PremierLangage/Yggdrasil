extends = sum_.pl

title = Somme de carrés successifs

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON
v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])
a=1

if param['boundtype']==1:
    b0=randint(-4,4,[0])
    b=n+b0
elif param['boundtype']==2:
    b=randint(2,4)*n+randint(-1,1)

n0=int(max([0,max(solve(a-b,n))]))
S = Sum(v**2, (v, a, b))
S_tex=latex(S)
n_tex=latex(n)
sol=simplify(b*(b+1)*(2*b+1)/6)
sol_tex=latex(sol)
==


