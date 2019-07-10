extends = /Mathematics/template/mathexpr.pl

title = Polynômes quadratiques

lang = fr

before ==
a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint(2,-6,6,[0])
var('x')
f=a*x+b
if param['roots']=='int':
    P=(x+b)*(x+d)
if param['roots']=='intrat':
    P=(x+b)*(c*x+d)
if param['roots']=='rat':
    P=(a*x+b)*(c*x+d)
lstsol=list(solveset(P,x,domain=S.Reals))
P=expand(P)
latexP=latex(P)
==



