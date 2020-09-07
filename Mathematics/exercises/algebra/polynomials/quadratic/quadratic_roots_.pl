extends = /model/mathinput.pl

title = Equation quadratique

before ==
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

if len(lstsol)==1:
    solution_roots=r"L'unique solution est $! \displaystyle %s !$." % latex(lstsol[0])
elif len(lstsol)==2:
    solution_roots=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(lstsol[0]),latex(lstsol[1]))
==


text ==
Déterminer les solutions de l'équation $% {{P|latex}} = 0 %$. Séparer les différentes solutions par une virgule.
==

evaluator ==
score, error = eval_set(input.value, lstsol, wobracket=True)
feedback = message[error]
==

solution ==
{{solution_roots}}
==




