# Author: D. Doyen
# Tags: fractions, algebraic operations
# Calculer avec les fractions
# Parameters:
# - formulas: lists de chaînes indiquant 
# les types de calculs proposés
# 19/7/2021

title = Calculer avec des fractions

# Paramètres
# 0 : f+f
# 1 : f*f
# 2 : f/f
# 3 : e+f
# 4 : e*f
# 5 : e/f
# 6 : f+f+f
# 7 : e+f+f
# 8 : f/(f+f)
# 9 : f/(e+f)
# 10 : f*(f+f)
# 11 : f*f+f
# 12 : f*(e+f)
# 13 : f-(f+f)
# 14 : f-(e+f)

extends = /model/math/multimathinput.pl

param.types = [0, 1, 2, 3]

before ==
n = len(param['types'])
inputs = [MathInput(type="expr") for _ in range(n)]

def generate(i):
    lstfrac=[(choice([1,3,5,7]),2),
    (choice([1,2,4,5,7,8]),3),
    (choice([1,3,5,7]),4),
    (choice([1,2,3,4,6,7,8]),5),
    (choice([1,5,7]),6)]
    cf1,cf2,cf3=sample(lstfrac, 3)
    f1='\\frac{ %d }{ %d }' % (cf1[0],cf1[1])
    f2='\\frac{ %d }{ %d }' % (cf2[0],cf2[1])
    f3='\\frac{ %d }{ %d }' % (cf3[0],cf3[1])

    e1=randint(1,3)
    e1=str(e1)
    s1=choice(["-","+"])
    s2=choice(["-","+"])
    p1,p2=sample([f1,e1],2)
    q1,q2,q3=sample([f1,f2,e1],3)


    lst_expr = ['%s %s %s' % (f1,s1,f2),
        r'%s \times %s' % (f1,f2),
        r'\frac{ %s }{ %s }' % (f1,f2),
        '%s %s %s' % (p1,s1,p2),
        r'%s \times %s' % (p1,p2),
        r'\frac{ %s }{ %s }' % (p1,p2),
        r'%s %s %s %s %s' % (f1,s1,f2,s2,f3),
        r'%s %s %s %s %s' % (q1,s1,q2,s2,q3),
        choice([r"\frac{ %s }{ %s %s %s }" % (f3,f1,s1,f2), r"\frac{ %s %s %s }{ %s }" % (f1,s1,f2,f3)]),
        choice([r"\frac{ %s }{ %s %s %s }" % (f3,p1,s1,p2), r"\frac{ %s %s %s }{ %s }" % (p1,s1,p2,f3)]),
        choice([r"%s \times \left( %s %s %s \right)" % (f3,f1,s1,f2), r"\left( %s %s %s \right)\times  %s" % (f1,s1,f2,f3)]),
        choice([r"%s \times %s %s %s" % (f3,f1,s1,f2), r"%s %s %s \times %s" % (f1,s1,f2,f3)]),
        choice([r"%s \times \left(%s %s %s \right)" % (f3,p1,s1,p2), r"\left(%s %s %s \right) \times %s" % (p1,s1,p2,f3)]),
        r'%s - \left(%s %s %s \right)' % (f1,f2,s1,f3),
        choice([r"%s - \left(%s %s %s \right)" % (f3,p1,s1,p2), r" - \left(%s %s %s \right) +%s" % (p1,s1,p2,f3)])]

    expr = lst_expr[i]
    sol=simplify(latex2sympy(expr))
    return expr, sol


prefixes = []
for i in range(n):
    expr, sol = generate(param['types'][i])
    prefixes.append(rf"$! \displaystyle {expr} = !$")
    inputs[i].sol = sol
==

question ==
Calculer les expressions suivantes en les écrivant sous la forme d'un entier ou d'une fraction irréductible.
==


wims ==
\if{\type=15}{
\text{T1=choice(\f1 \s1 \e1,\e1 \s1 \f1)}
\text{rep=simplify(\f2*(\T1))}
\text{expr=choice(texmath(\f2) \times \left(texmath(\T1)\right), \left(texmath(\T1)\right) \times texmath(\f2))}
}

\if{\type=16}{
\if{choice(1,2)=1}{
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
\text{T1=choice(\e1 \s1 \f1,\f1 \s1 \e1)}
\text{rep=simplify((\T1)/(\f2))}
\text{expr=\frac{texmath(\T1)}{texmath(\f2)}}
}

\if{\type=20}{
\text{T1=choice(\e1 \s1 \f1,\f1 \s1 \e1)}
\text{rep=simplify((\T1)/\ee2)}
\text{expr=\frac{texmath(\T1)}{texmath(\ee2)}}
}


\if{\type=22}{
\text{rep=simplify(\ee1/(\f1 \s1 \f2))}
\text{expr=\frac{texmath(\ee1)}{texmath(\f1 \s1 \f2)}}
}

\if{\type=23}{
\text{T1=choice(\e1 \s1 \f2,\f2 \s1 \e1)}
\text{rep=simplify(\f1/(\T1))}
\text{expr=\frac{texmath(\f1)}{texmath(\T1)}}
}

\if{\type=24}{
\text{T1=choice(\e2 \s1 \f1,\f1 \s1 \e2)}
\text{rep=simplify(\ee1/(\T1))}
\text{expr=\frac{texmath(\ee1)}{texmath(\T1)}}
}
==







