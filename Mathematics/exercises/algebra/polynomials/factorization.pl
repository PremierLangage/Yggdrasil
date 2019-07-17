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

lst=[]
for i in range(2):
    Q=rand_factor()
    latexQ=latex(Q)
    term='( %s )( %s )' % (latexP,latexQ)
    lst.append(term)

expr=lst[0]
for i in range(len(lst)-1):
    expr+="+"+lst[i+1]

sol=str2expr(expr)
sol=sol.expand()
==

text = {{sol}} Factoriser $% {{expr}} %$.

evaluator==
x=Symbol('x')
score,numerror,feedback=ans_poly_factor(answer['1'],x,sol)
==


