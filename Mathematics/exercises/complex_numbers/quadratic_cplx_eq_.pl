extends = /model/math/input.pl

title = Equation quadratique

param.roots = int

before ==
a,b=list_randint(2,-4,4,[0])
a2,b2=list_randint(2,-4,4,[0])
while equal(a-b*I,a2+b2*I):
    a2,b2=list_randint(2,-4,4,[0])

c=randint(-5,5,[0,1,-1])
s=randitem([-1,1])
s2=randitem([-I,I,1+I,1-I,I-1])

var('x')
if param['roots']=='int':
    P=s*(x+a+b*I)*(x+a-b*I)
if param['roots']=='int2':
    P=s*(x+a+b*I)*(x+a2+b2*I)
if param['roots']=='int3':
    P=s2*(x+a+b*I)*(x+a2+b2*I)
if param['roots']=='rat':
    P=s*(c*x+a+b*I)*(c*x+a-b*I)
lstsol=list(solveset(P,x,domain=S.Complexes))
P = poly(expand(P),x)
solution=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(lstsol[0]),latex(lstsol[1]))
==

question ==
Déterminer les solutions (complexes) de l'équation $! {{ P|latex }} = 0 !$. Séparer les différentes solutions par une virgule.
==