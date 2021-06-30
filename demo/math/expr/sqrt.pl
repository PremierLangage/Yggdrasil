extends = /model/math/expr.pl

before ==

if param['form']=="p sqrt(q)":
    p=randint(2,5)
    q=choice([2,3,4,5,7,9])
    sol=p**2*q
    expr=r"%d \sqrt{ %d }" % (p,q)
elif param['form']=="p sqrt(q) sqrt(r)":
    p=randint(2,3)
    q,r=sample([2,3,4,5,7,9], 2)
    sol=p**2*q*r
    expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
elif param['form']=="p sqrt(q)/sqrt(r)":
    p=randint(2,4)
    q,r=sample([2,3,4,5,7,9], 2)
    sol=p**2*q/r
    expr=r"%d \frac{ \sqrt{ %d } }{ \sqrt{ %d } }" % (p,q,r)
==

text ==
Ecrire l'expression suivante sous la forme  $% \sqrt{a} %$, où $% a %$ est un entier.
==

prefix ==
$! {{expr}} = !$
==

embed ==
\sqrt{#}
==
