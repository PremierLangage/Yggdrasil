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

n0=0
S = Sum(v**2, (v, a, b))
S_tex=latex(S)
n_tex=latex(n)
sol=(b-a+1)*(a+b)/2
sol_tex=latex(sol)
==


