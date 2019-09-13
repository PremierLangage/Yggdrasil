extends = /Mathematics/template/mathcheckbox.pl

title = Signe d'une puissance

lang = fr

before ==
def latex_number(s,x,y):
    tex=""
    if x<0:
        tex="%s ( %d )^{ %d }" % (s,x,y)
    else:
        tex="%s %d ^{ %d }" % (s,x,y)
    return tex

sol=list_randitem(4,[True,False])
choices=[]
for i in range(len(sol)):
    with evaluate(False):
        a=randint(2,20)
        b=randint(5,15)
        p,q=2*b,2*b+1
        r=randitem([p,q])
        nn=randitem([("",-a,q),("-",-a,p),("-",a,r)])
        np=randitem([("",-a,p),("-",-a,q)])
        if sol[i]:
            s=latex_number(*nn)
        else:
            s=latex_number(*np)
    choices.append({"id":str(i),"content":"$$ "+s+" $$"})
component.items = choices
==

text ==
Sélectionner les nombres négatifs dans la liste ci-dessous.
==
