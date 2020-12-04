extends = /model/mathinput.pl

title = Linéarité


before ==
v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])
var('A')
a=randint(1,4)
b0=randint(-4,4,[0])
b=n+b0
n0=max([0,a-b0])
while True:
    p1,p2=list_randint_norep(2,-5,5,[0])
    q1,q2=list_randint_norep(2,-5,5,[0])
    c1,c2=list_randitem_norep(2,[randitem([-1,1]),randint(-3,3,[-1,1,0])])
    if (c1*p1+c2*p2)*(c1*q1+c2*q2)!=0:
        break

if param['coeff']==2:
    lst=[p1,p2,q1,q2]
    lst[randint(0,3)]=randitem([-n,n])
    p1,p2,q1,q2=lst

n0=int(max([0,max(solve(a-b,n))]))

E = c1*Sum(p1*v+q1, (v, a, b))+c2*Sum(p2*v+q2, (v, a, b))

if param['type']=="linearity":
    sol=(c1*p1+c2*p2)*A+(c1*q1+c2*q2)*(b-a+1)
elif param['type']=="compute":
    sol=simplify((c1*p1+c2*p2)*(b-a+1)*(a+b)/2)+simplify((c1*q1+c2*q2)*(b-a+1))
==


evaluator==
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
La solution est $! {{sol|latex}} !$.
==



