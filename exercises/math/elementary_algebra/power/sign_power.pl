extends = /model/math/checkbox.pl

title = Signe d'une puissance


before ==
from sympy import evaluate

def latex_number(s,x,y):
    tex=""
    if x<0:
        tex="%s ( %d )^{ %d }" % (s,x,y)
    else:
        tex="%s %d ^{ %d }" % (s,x,y)
    return tex

sol = sample([0, 1, 2, 3], randint(1, 4))
items = []
for i in range(4):
    with evaluate(False):
        a=randint(2,20)
        b=randint(5,15)
        p,q=2*b,2*b+1
        r=choice([p,q])
        nn=choice([("",-a,q),("-",-a,p),("-",a,r)])
        np=choice([("",-a,p),("-",-a,q)])
        if i in sol:
            s=latex_number(*nn)
        else:
            s=latex_number(*np)
    items.append("$! "+s+" !$")
==

question ==
Sélectionner les nombres négatifs dans la liste ci-dessous.
==


