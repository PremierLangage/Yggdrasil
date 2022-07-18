extends = limit_.pl

title = Calcul de limites

before ==
ninput=3
lstinput=[input1,input2,input3]


var('x')
latexlim=[]
sol=[]

lstd=list_randint_norep(3,2,7) 
lsta=list_randitem_norep(3,[oo,oo,-oo,-oo])

for (d,a) in zip(lstd,lsta):
    f=rand_int_poly(d,randint(2,3),5,x)
    lim=Limit(f, x, a)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==



