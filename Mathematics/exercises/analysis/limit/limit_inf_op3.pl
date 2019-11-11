extends = limit_.pl

title = Calcul de limites

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
f=[x**n1,exp(x),ln(x)]

for _ in rane(3):
    rd.shuffle(f)
    lim=Limit(f[i0]/(f[i1]-f[i2]), x, oo)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==


