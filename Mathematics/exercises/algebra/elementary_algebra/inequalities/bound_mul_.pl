extends = /Mathematics/template/mathexpr.pl

title = Encadrement d'un produit

lang = fr

before ==
var('x,y')
if param['sign']=="constant":
    x1,x2=randitem([sorted(list_randint_norep(2,-8,0)),sorted(list_randint_norep(2,0,8))])
    y1,y2=randitem([sorted(list_randint_norep(2,-8,0)),sorted(list_randint_norep(2,0,8))])
else:
    x1,x2=randint(-8,-1),randint(0,8)
    y1,y2=randint(-8,0),randint(1,8)

sx1,sx2=list_randitem(2,['<','<='])
sy1,sy2=list_randitem(2,['<','<='])

def strictest(s1,s2):
    if s1=='<=' and s2=='<=':
        return '<='
    else:
        return '<'

def largest(s1,s2):
    if s1=='<' and s2=='<':
        return '<'
    else:
        return '<='

z1=min([x1*y1,x2*y2,x1*y2,x2*y1])
z2=max([x1*y1,x2*y2,x1*y2,x2*y1])

s1='<'
if x1*y1==z1:
    s1=largest(s1,strictest(sx1,sy1))
if x2*y2==z1:
    s1=largest(s1,strictest(sx2,sy2))
if x1*y2==z1:
    s1=largest(s1,strictest(sx1,sy2))
if x2*y1==z1:
    s1=largest(s1,strictest(sx2,sy1))
if 0==z1:
    s1='<='

s2='<'
if x1*y1==z2:
    s2=largest(s2,strictest(sx1,sy1))
if x2*y2==z2:
    s2=largest(s2,strictest(sx2,sy2))
if x1*y2==z2:
    s2=largest(s2,strictest(sx1,sy2))
if x2*y1==z2:
    s2=largest(s2,strictest(sx2,sy1))
if 0==z2:
    s2='<='

sol=[z1,s1,x*y,s2,z2]

boundx=latex_ineq([x1,sx1,x,sx2,x2])
boundy=latex_ineq([y1,sy1,x,sy2,y2])

expr=latex(x*y)
==

text ==
Soit $%x%$ et $%y%$ des nombres tels que $%{{boundx}} %$ et $%{{boundy}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr}} %$.
==

evaluator==
score,_,feedback=ans_chained_ineq(answer['1'],sol)
==
