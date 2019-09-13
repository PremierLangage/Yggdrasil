extends = /Mathematics/template/mathexpr.pl

title = Polynômes quadratiques

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint_norep(2,-6,6,[0])
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
sol=factor(P)

solution_factor=r"Une factorisation de cette expression est $! %s !$." % latex(sol)

if len(lstsol)==1:
    solution_roots=r"L'unique solution est $! \displaystyle %s !$." % latex(lstsol[0])
elif len(lstsol)==2:
    solution_roots=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(lstsol[0]),latex(lstsol[1]))
==








