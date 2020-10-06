extends = limit_.pl

title = Calcul de limites

before ==
ninput=3
lstinput=[input1,input2,input3]


var('x')
latexlim=[]
sol=[]

for _ in range(3):
    n0=randint(1,5)   
    g=[x**n0,exp(x),ln(x)]
    rd.shuffle(g)
    f=randitem([g[0]/(g[1]-g[2]),(g[0]-g[1])/g[2]])
    lim=Limit(f, x, oo)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==



