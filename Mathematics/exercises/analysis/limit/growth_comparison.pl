extends = limit_.pl

title = Calcul de limites

lang = fr


before ==
lstinput=[input1,input2,input3,input4]

keyboards_JSON['virtualKeyboards']="functions"
input1.config = keyboards_JSON
input2.config = keyboards_JSON
input3.config = keyboards_JSON
input4.config = keyboards_JSON

var('x')
latexlim=[]
sol=[]
for i in range(4):
    n=randint(1,4)
    f,g=list_randitem_norep(2,[x**n,exp(x),ln(x)])
    lim=Limit(f-g, x, oo)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==

text ==
Calculer les limites suivantes.
==




