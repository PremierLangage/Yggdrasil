extends = /Mathematics/template/mathexpr.pl

title = Opérations sur les fractions

lang = fr
param.terms=2

before ==
if param['terms']=="2":
    n=2
    k=randitem([11,12,13,14,15,16,17,18,19])
if param['terms']=="3":
    n=3
    k=randitem([7,9,11,13,14,15])
a=list_randint(n,2,5)
b=list_randint_norep(n,2,5)
f=[]
ff=[]
for i in range(len(b)):
    b[i]=k*b[i]
    while gcd(a[i],b[i])!=1:
        a[i]=randint(1,5) 
    f.append(Rational(a[i],b[i]))
    ff.append('\\frac{ %d }{ %d }' % (a[i],b[i]))

if param['terms']=="2":
    sol=f[0]+f[1]
    expr='%s + %s' % (ff[0],ff[1])
if param['terms']=="3":
    sol=f[0]+f[1]-f[2]
    expr='%s + %s - %s' % (ff[0],ff[1],ff[2])

latexsol=latex(sol)
==

text ==
Simplifier l'expression $% \displaystyle {{expr}}%$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==

evaluator==
score,_,feedback=ans_frac(answer['1'],sol)
==

hint ==
Penser au PPCM
==

solution ==
La solution est $% {{latexsol}} %$.
==



