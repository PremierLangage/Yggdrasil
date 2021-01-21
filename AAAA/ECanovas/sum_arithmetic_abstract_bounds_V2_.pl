extends = sum_V2_.pl

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
    b=randitem([n+1,n-1])
    c= randint(0,3)
    d= randint(1,9)
    f= d*k**c
elif niveau==2:
    #a= 0 ou 2,3,4,5 , b idem,
    a=randitem([0,2,3,4,5])
    b=randitem([n+1,n-1])
    c= randint(0,3)
    d= randint(1,9)
    f= d*k**c
elif niveau==3.1:
    #a entre 2 et 5, b  =n-1, n, n+1, 2n-1, 2n+1, n^2, n^2-1, n^2+1,  c entre 0 et 3, d=1,..9
    a=randitem([2,3,4,5])
    b=randitem([n+1,n-1,n,2*n-1,2*n+1,n**2, n**2-1, n**2+1])
    c= randint(0,3)
    d= randint(1,9)
    f= d*k**c
elif niveau==3.2:
    # cas 3.2.1  a, entre 10 et 20,  b  =n-1, n, n+1, 2n-1, 2n+1, n^2, n^2-1, n^2+1, 
    # ou
    # cas 3.2.2  a,=n-1, n, n+1 et b = n-1, 2n+1, n^2, n^2-1, n^2+1, ET c entre 1 et 3, d=1,..9
    a,b=randitem([(randint(10,20),randitem([n-1,n,n+1,2*n-1,2*n+1,n**2,n**2-1,n**2+1])),
                    (randitem([n-1,n,n+1]),randitem([n-1,2*n+1,n**2,n**2-1,n**2+1]))])
    c= randint(1,3)
    d= randint(1,9)
    f= d*k**c

#n0=int(max([0,max(solve(a-b,n))]))
S = Sum(f, (k, a, b)).doit()
Ssol= simplify(S)
sol=S
==

text ==
Soit un entier $! {{ n|latex}} \geq {{n0}} !$. Calculer $! \displaystyle {{S|latex}} !$.
==



