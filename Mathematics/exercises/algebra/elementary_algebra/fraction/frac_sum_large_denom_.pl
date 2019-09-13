extends = /Mathematics/template/mathexpr.pl

title = Opérations sur les fractions

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

if param['terms']=="2":
    n=2
    k=randitem([11,12,13,14,15,16,17,18,19])
if param['terms']=="3":
    n=3
    k=randitem([7,9,11,13,14,15])

a=list_randint(n,2,5)
b=list_randint_norep(n,2,5)
f=[]
for i in range(len(b)):
    b[i]=k*b[i]
    while gcd(a[i],b[i])!=1:
        a[i]=randint(1,5) 
    f.append('\\frac{ %d }{ %d }' % (a[i],b[i]))

s1=randitem("-","+")
s2=randitem("-","+")

if param['terms']=="2":
    expr='%s %s %s' % (f[0],s1,f[1])
if param['terms']=="3":
    expr='%s %s %s %s %s' % (f[0],s1,f[1],s2,f[2])

sol=simplify(str2expr(expr))
sol_tex=latex(sol)
==

text ==
Calculer l'expression $% \displaystyle {{expr}}%$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==

evaluator==
score,_,feedback=ans_frac(input1.value,sol)
==

hint ==
Penser au PPCM
==

solution ==
La solution est $% {{sol_tex}} %$.
==







