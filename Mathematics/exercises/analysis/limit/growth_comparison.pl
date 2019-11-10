extends = limit_.pl

title = Calcul de limites

lang = fr


before ==
ninput=3
lstinput=[input1,input2,input3]

keyboards_JSON['virtualKeyboards']="functions"
input1.config = keyboards_JSON
input2.config = keyboards_JSON
input3.config = keyboards_JSON
input4.config = keyboards_JSON

var('x')
latexlim=[]
sol=[]

n1,n2=list_randint(2,1,5)   
lstf=[[x**n1,exp(x)],[x**n1,ln(x)],[exp(x),ln(x)]]
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




