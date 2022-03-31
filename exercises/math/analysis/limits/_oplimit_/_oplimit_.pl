extends = /model/math/multinput.pl
title = Calcul de limites

param.form = [0, 0, 0]

before ==
inf = [ln(x), exp(x), x]
f = [atan(x), x/(x+1)]
b = [sin(x), cos(x)]


def rand_expr(i):
    inf1, inf2 = sample(inf, 2)
    f1, f2 = sample(f, 2)
    b1, b2 = sample(b, 2)
    if i == 0:
        return inf1 - inf2
    elif i == 1:
        return inf1 + f1
    elif i == 2:
        return inf1 + b1


lstinput=[input1,input2,input3]



var('x')
latexlim=[]
sol=[]

n1,n2=list_randint(2,1,5)   
lstf=[[x**n1,exp(x)],[x**n2,ln(x)],[exp(x),ln(x)]]
rd.shuffle(lstf)

for f in lstf:
    rd.shuffle(f)
    lim=Limit(f[0]-f[1], x, oo)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==

question ==
Calculer les limites suivantes.
==

