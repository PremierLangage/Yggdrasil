extends = /Mathematics/template/mathinput.pl

title = Equation quadratique

lang = fr

param.roots = int

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input.config = keyboards_JSON

a,b=list_randint(2,-4,4,[0])
a2,b2=list_randint(2,-4,4,[0])

c=randint(-5,5,[0,1,-1])
s=randitem([-1,1])
var('x')
if param['roots']=='int':
    P=s*(x+a+b*I)*(x+a-b*I)
if param['roots']=='int2':
    P=s*(x+a+b*I)*(x+a2+b2*I)
if param['roots']=='rat':
    P=s*(c*x+a+b*I)*(c*x+a-b*I)
lstsol=list(solveset(P,x,domain=S.Complexes))
P=collect(expand(P),x)
latexP=latex(P)
solution=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(lstsol[0]),latex(lstsol[1]))
==

text ==
Déterminer les solutions (complexes) de l'équation $! {{latexP}} = 0 !$. Séparer les différentes solutions par une virgule.
==

evaluator==
score,_,feedback=ans_struct_complex(input.value,lstsol,"setwobraces")
==







