extends = /Mathematics/template/mathexpr.pl

title = Opérations sur les fractions

lang = fr

before ==
lstfrac=[(randitem([1,3,5,7]),2),
(randitem([1,2,4,5,7,8]),3),
(randitem([1,3,5,7]),4),
(randitem([1,2,3,4,6,7,8]),5),
(randitem([1,5,7]),6)]
cf1=randitem(lstfrac)
cf2=randitem(lstfrac)
f1=Rational(*cf1)
f2=Rational(*cf2)
ff1='\\frac{ %d }{ %d }' % (cf1[0],cf1[1])
ff2='\\frac{ %d }{ %d }' % (cf2[0],cf2[1])
e1=randint(1,3)
ee1=str(e1)

op=randitem(["e1+f1","e1-f1","e1*f1","e1/f1"])

op=randitem(eval(param['formulas']))

if op in["f+f","f-f","f1*f2","f1/f2"]:
    if op=="f+f":
        sol=f1+f2
        expr='%s + %s' % (ff1,ff2)
    elif op=="f-f":
        sol=f1-f2
        expr='%s - %s' % (ff1,ff2)
    elif op=="f1*f2":
        sol=f1*f2
        expr='%s \times %s' % (ff1,ff2)
    elif op=="f1/f2":
        sol=f1/f2
        expr='\\frac{%s}{%s}' % (ff1,ff2)
elif op in ["f+e","f-e","e1*f1","e1/f1"]:
    [[n0,nn0],[n1,nn1]]=rd.sample([[f1,ff1],[e1,ee1]],2)
    if op=="f+e":
        sol=n0+n1
        expr='%s + %s' % (nn0,nn1)
    elif op=="f-e":
        sol=n0-n1
        expr='%s - %s' % (nn0,nn1)
    elif op=="e1*f1":
        sol=n0*n1
        expr='%s \\times %s' % (nn0,nn1)
    elif op=="e1/f1":
        sol=n0/n1
        expr='\\frac{ %s }{ %s }' % (nn0,nn1)

latexsol=latex(sol)
==

text ==
Simplifier l'expression $% \displaystyle {{expr}}%$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==

hint ==
Penser au PPCM
==


evaluator==
score,_,feedback=ans_frac(answer['1'],sol)
==

solution==
La solution est $% {{latexsol}} %$.
==


