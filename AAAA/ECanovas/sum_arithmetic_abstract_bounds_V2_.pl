extends = /Mathematics/exercises/algebra/finitesums/sum_.pl

title = Somme d'entiers successifs

before ==
#v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
v=Symbol('v')
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])

k  = symbols('k', integer=True)

niveau=param['boundtype']
if niveau==1:
    # a = 1 ,   b= n-1,  n+1, c= 0,1,2,3, d =1,...., 9
    a=1 
    b0=randint(-1,1,[0])
    b=n+b0
    b=randitem([n+1,n-1])
    c= randint(0,3)
    d= randint(1,9)
    f= d*k**c
elif niveau==2:
    an,bn=randitem([(n,2*n),(2*n,3*n),(n,3*n),(n,4*n)])
    a0=randint(1,4)
    a=a0+an
    b0=randint(-4,4,[0])
    b=bn+b0
n0=int(max([0,max(solve(a-b,n))]))
S = Sum(f, (v, a, b))
sol=S
==

text ==
Soit un entier $! {{ n|latex}} \geq {{n0}} !$. Calculer $! \displaystyle {{S|latex}} !$.
==



