
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Permutation1

text== 
Pour n entier naturel, une permutation p de $%\\{0..n\\}%$  est donnée par une liste permu[i]=c ssi p(i)=c.<br>
ainsi la permutation p de $%\\{0..4\\}%$ : <br>$%p(i)= 2i\mod 5 %$, <br>
est représentée par la liste [0,2,4,1,3].<br>
la puissance fonctionnelle est :<br>
$%{\displaystyle \forall n\in \mathbb {N} ^{*}\quad p^{n}=\underbrace {p\circ \ldots \circ p} _{n\ \mathrm {fois} }}%$
<br>
Ecrire une fonction qui reçoit une liste représentant une permutation et un entier n
$%p%$ et renvoie liste représentant la puissance fonctionnelle $%p^n%$
==

before==
import random
def genere_permut(n):
    l=[x for x in range(n)]

    perm=[]
    for i in range(n):
     ind= random.randint(0,n-1-i)
        val=l[ind]
        perm.append(val)
        l[ind],l[n-1-i]=l[n-1-i],l[ind]
    return perm

def puiss_fonc(l,n):
    res=list()
    for i in range(len(l)):
        c=l[i]
        for j in range(n):
            c=l[c]
        res.append(c)
    return res

taille=random.randint(1,20)
l=genere_permut(taille)
exposant=random.randint(1,10)

pltest3=""">>> puiss_fonc({},{})\n{}""".format(l,exposant,puiss_fonc(l,exposant))
==
pltest0==
>>> puiss_fonc([1,0,2],1]==[1,0,2]
True
