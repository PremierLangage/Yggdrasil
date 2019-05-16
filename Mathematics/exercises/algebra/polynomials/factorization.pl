extends = /Mathematics/template/mathexpr.pl

title = Factorisation

lang = fr

before ==
x=Symbol('x')
a,b,c,d=list_randint(4,-2,2,[0])
P=a*x+b
Q=c*x+d
latexP=latex(P)
latexQ=latex(Q)
sol=(P*Q).expand()
latexsol=latex(sol)
==

text = Factoriser $% {{latexsol}} %$.

evaluator==
#x=sp.Symbol('x')
score,numerror,feedback=ans_poly_factor(answer['1'],x,sol)
==

