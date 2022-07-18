extends = /model/math/chainineq.pl

title = Encadrement d'un produit

param.sign = constant

before ==
from sympy2latex import latex_chainineq
var('x,y')
if param['sign']=="constant":
    x1,x2=choice([sorted(sampleint(-8,0, 2)),sorted(sampleint(0,8, 2))])
    y1,y2=choice([sorted(sampleint(-8,0, 2)),sorted(sampleint(0,8, 2))])
else:
    x1,x2=randint(-8,-1),randint(0,8)
    y1,y2=randint(-8,0),randint(1,8)

sx1,sx2=sample(['<','<='], 2)
sy1,sy2=sample(['<','<='], 2)

if sx1 == '<':
    left_open = True
else:
    left_open = False

if sx2 == '<':
    right_open = True
else:
    right_open = False

Ix = Interval(x1, x2, left_open, right_open)

if sy1 == '<=':
    left_open = True
else:
    left_open = False

if sy2 == '<=':
    right_open = True
else:
    right_open = False

Iy = Interval(y1, y2, left_open, right_open)

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
# BUG ?
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
# BUG ?
if 0==z2:
    s2='<='

if s1 == '<':
    left_open = True
else:
    left_open = False

if s2 == '<':
    right_open = True
else:
    right_open = False

sol = Interval(z1, z2, left_open, right_open)

boundx = latex_chainineq(x, Ix)
boundy = latex_chainineq(y, Iy)

expr = x*y
==


question  ==
Soit $! x !$ et $%y%$ des nombres tels que $! {{boundx}} !$ et $%{{boundy}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr}} %$.
==
