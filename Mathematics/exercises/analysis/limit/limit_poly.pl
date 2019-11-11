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
lsta=list_randitem_norep(3,[oo,oo,-oo,-oo])
lstf=[x,x**2,x**3]
rd.shuffle(lstf)

for (f,a) in zip(lstf,lsta):
    lim=Limit(f, x, a)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==


