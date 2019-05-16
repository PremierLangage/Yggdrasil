extends = Mathematics/template/mathexpr.pl

title = Transformation d'écritures (racine carrée) 1

lang = fr

virtualKeyboards = elementary

before ==
from sympy.ntheory.factor_ import core
p,b=1,1
while (b==p) or (b==1):
    p=randint(50,200)
    b=core(p)
a=int(sqrt(p/b))
sol=a*sqrt(b)
==

text ==
Ecrire $% \sqrt{ {{p}} }%$ sous la forme  $% a \sqrt{b}%$, où $%a%$ est un entier et $%b%$ est le plus petit entier positif possible.
==

evaluator==
ans=str2expr(answer['1'])
if type(ans)==sp.Mul and set(sol.args)==set(ans.args):
    score=100
else:
    score=0
feedback="" 
==





