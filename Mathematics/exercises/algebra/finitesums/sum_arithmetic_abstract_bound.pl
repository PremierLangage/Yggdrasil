extends = sum_.pl

title = Somme d'entiers successifs

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=Symbol('n')
a=randint(1,4)
b=n+randint(1,4)
S = Sum(v, (v, a, b))
S_tex=latex(S)
sol=S.doit()
sol_tex=latex(sol)
==
