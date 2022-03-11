extends = /model/math/input.pl


title = Calcul de limites


before ==
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

text ==
Calculer les limites suivantes.
==





