extends = /Mathematics/template/mathexpr.pl

title = Opérations sur les fractions

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

lstfrac=[(randitem([1,3,5,7]),2),
(randitem([1,2,4,5,7,8]),3),
(randitem([1,3,5,7]),4),
(randitem([1,2,3,4,6,7,8]),5),
(randitem([1,5,7]),6)]
cf1,cf2,cf3=list_randitem_norep(3,lstfrac)
f1='\\frac{ %d }{ %d }' % (cf1[0],cf1[1])
f2='\\frac{ %d }{ %d }' % (cf2[0],cf2[1])
f3='\\frac{ %d }{ %d }' % (cf3[0],cf3[1])

e1=randint(1,3)
e1=str(e1)
s1=randitem(["-","+"])
s2=randitem(["-","+"])
p1,p2=rd.sample([f1,e1],2)
q1,q2,q3=rd.sample([f1,f2,e1],3)

op=randitem(eval(param['formulas']))

if op=="f+f":
    expr='%s %s %s' % (f1,s1,f2)
elif op=="f*f":
    expr='%s \times %s' % (f1,f2)
elif op=="f/f":
    expr='\\frac{ %s }{ %s }' % (f1,f2)
elif op=="e+f":
    expr='%s %s %s' % (p1,s1,p2)
elif op=="e*f":
    expr='%s \\times %s' % (p1,p2)
elif op=="e/f":
    expr='\\frac{ %s }{ %s }' % (p1,p2)
elif op=="f+f+f":
    expr=r'%s %s %s %s %s' % (f1,s1,f2,s2,f3)
elif op=="e+f+f":
    expr=r'%s %s %s %s %s' % (q1,s1,q2,s2,q3)
elif op=="f/(f+f)":
    expr1=r"\frac{ %s }{ %s %s %s }" % (f3,f1,s1,f2)
    expr2=r"\frac{ %s %s %s }{ %s }" % (f1,s1,f2,f3)
    expr=randitem([expr1,expr2])
elif op=="f/(e+f)":
    expr1=r"\frac{ %s }{ %s %s %s }" % (f3,p1,s1,p2)
    expr2=r"\frac{ %s %s %s }{ %s }" % (p1,s1,p2,f3)
    expr=randitem([expr1,expr2])
elif op=="f*(f+f)":
    expr1=r"%s \times \left( %s %s %s \right)" % (f3,f1,s1,f2)
    expr2=r"\left( %s %s %s \right)\times  %s" % (f1,s1,f2,f3)
    expr=randitem([expr1,expr2])
elif op=="f*f+f":
    expr1=r"%s \times %s %s %s" % (f3,f1,s1,f2)
    expr2=r"%s %s %s \times %s" % (f1,s1,f2,f3)
    expr=randitem([expr1,expr2])
elif op=="f*(e+f)":
    expr1=r"%s \times \left(%s %s %s \right)" % (f3,p1,s1,p2)
    expr2=r"\left(%s %s %s \right) \times %s" % (p1,s1,p2,f3)
    expr=randitem([expr1,expr2])
elif op=="f-(f+f)":
    expr=r'%s - \left(%s %s %s \right)' % (f1,f2,s1,f3)
elif op=="f-(e+f)":
    expr1=r"%s - \left(%s %s %s \right)" % (f3,p1,s1,p2)
    expr2=r" - \left(%s %s %s \right) +%s" % (p1,s1,p2,f3)
    expr=randitem([expr1,expr2])


sol=simplify(str2expr(expr))
sol_tex=latex(sol)
==

text ==
Calculer l'expression $% \displaystyle {{expr}}%$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==

input1.config % { "virtualKeyboards": "elementary"}

evaluator==
score,_,feedback=ans_frac(input1.value,sol)
==

solution==
La solution est $% \displaystyle {{sol_tex}} %$.
==


wims ==





\if{\type=15}{
\text{T1=randitem(\f1 \s1 \e1,\e1 \s1 \f1)}
\text{rep=simplify(\f2*(\T1))}
\text{expr=randitem(texmath(\f2) \times \left(texmath(\T1)\right), \left(texmath(\T1)\right) \times texmath(\f2))}
}

\if{\type=16}{
\if{randitem(1,2)=1}{
\text{rep=simplify(\e1 \s1 \f2*\f3)}
\text{expr=texmath(\e1) \s1 texmath(\f2) \times texmath(\f3)}
}{
\text{rep=simplify(\f2*\f3 \s1 \e1)}
\text{expr=texmath(\f2) \times texmath(\f3) \s1 texmath(\e1)}
}
}


\if{\type=18}{
\text{rep=simplify((\f1 \s1 \f2)/\ee1)}
\text{expr=\frac{texmath(\f1 \s1 \f2)}{texmath(\ee1)}}
}

\if{\type=19}{
\text{T1=randitem(\e1 \s1 \f1,\f1 \s1 \e1)}
\text{rep=simplify((\T1)/(\f2))}
\text{expr=\frac{texmath(\T1)}{texmath(\f2)}}
}

\if{\type=20}{
\text{T1=randitem(\e1 \s1 \f1,\f1 \s1 \e1)}
\text{rep=simplify((\T1)/\ee2)}
\text{expr=\frac{texmath(\T1)}{texmath(\ee2)}}
}


\if{\type=22}{
\text{rep=simplify(\ee1/(\f1 \s1 \f2))}
\text{expr=\frac{texmath(\ee1)}{texmath(\f1 \s1 \f2)}}
}

\if{\type=23}{
\text{T1=randitem(\e1 \s1 \f2,\f2 \s1 \e1)}
\text{rep=simplify(\f1/(\T1))}
\text{expr=\frac{texmath(\f1)}{texmath(\T1)}}
}

\if{\type=24}{
\text{T1=randitem(\e2 \s1 \f1,\f1 \s1 \e2)}
\text{rep=simplify(\ee1/(\T1))}
\text{expr=\frac{texmath(\ee1)}{texmath(\T1)}}
}
==





