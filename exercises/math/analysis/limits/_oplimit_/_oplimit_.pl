extends = /model/math/multinput.pl
title = Calcul de limites

param.form = [

before ==
inf = [ln(x), exp(x), x]
f = [atan(x), x/(x+1)]
b = [sin(x), cos(x)]

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

