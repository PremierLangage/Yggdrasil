extends = limit_.pl

title = Calcul de limites

before ==
ninput=3
lstinput=[input1,input2,input3]


var('x')
latexlim=[]
sol=[]

d0=randint(2,7)
lstd=[[d0,d0]]+[list_randint(2,2,7) for _ in range(2)] 
rd.shuffle(lstd)
lsta=list_randitem_norep(3,[oo,oo,-oo,-oo])

for (d,a) in zip(lstd,lsta):
    f=rand_int_poly(d[0],randint(2,3),5,x)
    g=rand_int_poly(d[1],randint(2,3),5,x)
    lim=Limit(f/g, x, a)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==


