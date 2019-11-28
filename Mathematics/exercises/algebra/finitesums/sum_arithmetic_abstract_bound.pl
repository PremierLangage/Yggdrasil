extends = sum_.pl

title = Somme d'entiers successifs

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
S_tex=latex(S)
n_tex=latex(n)
sol=S.doit()
sol_tex=latex(sol)
==

text ==
Soit $! {{n_tex}} \geq {{n0}} !$. Calculer $! \displaystyle {{S_tex}} !$.
==
