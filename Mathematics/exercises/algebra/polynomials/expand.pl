extends = /Mathematics/template/mathexpr.pl

title = Développement

lang = fr

before ==
x=Symbol('x')
a,b,c,d=list_randint(4,1,5)
P=a*x+b
Q=c*x+d
latexP=latex(P)
latexQ=latex(Q)
sol=P*Q
==

text = Développer $% ({{latexP}})({{latexQ}}) %$.

evaluator==
score,numerror,feedback=ans_poly_expanded_rat(answer['1'],x,sol)
==


