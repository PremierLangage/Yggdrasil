extends = /Mathematics/template/mathexpr.pl

title = Factorisation

lang = fr

before ==
x=Symbol('x')

def rand_factor():
    x=Symbol('x')
    a,b=list_randint(2,-5,5,[0])
    return a*x+b

P=rand_factor()
latexP=latex(P)

latexR=""
for i in range(2):
    P=rand_factor()
    latexQ=latex(Q)
    term='( %s )( %s )' % (latexP,latexQ)
    latexR=latexR+"+"+term 

sol=(P).expand()
latexsol=latex(sol)
==

text = Factoriser $% {{latexR}} %$.

evaluator==
x=Symbol('x')
score,numerror,feedback=ans_poly_factor(answer['1'],x,sol)
==


