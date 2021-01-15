extends = Yggdrasil/Mathematics/exercises/algebra/finitesums/sum_.pl

title = Somme d'entiers successifs

before ==
v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])
if param['boundtype']==1:
    a=randint(1,4)
    b0=randint(-4,4,[0])
    b=n+b0
elif param['boundtype']==2:
    an,bn=randitem([(n,2*n),(2*n,3*n),(n,3*n),(n,4*n)])
    a0=randint(1,4)
    a=a0+an
    b0=randint(-4,4,[0])
    b=bn+b0
n0=int(max([0,max(solve(a-b,n))]))
S = Sum(v, (v, a, b))
sol=simplify((b-a+1)*(a+b)/2)
==

text ==
Soit un entier $! {{ n|latex}} \geq {{n0}} !$. Calculer $! \displaystyle {{S|latex}} !$.
==



