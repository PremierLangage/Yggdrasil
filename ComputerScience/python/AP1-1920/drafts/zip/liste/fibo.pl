



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Entiers de Gauss
text==  

On appelle "entier de Gauss" un nombre complexe $%z=a+\mathrm{i}b , a,b \in \mathbb{R} %$

Ecrire une fonction *nb_carre_Gauss(r)* qui recoit un nombre réel r et.renvoie la liste  des entiers de Gauss (de module inférieur à $%r%$) 
dont le carré est également un entier de Gauss de module inférieur à $%r%$. La liste est une liste de couples
 >>>carre_Gauss(2)
[(-2, 0), (-1, -1), (-1, 0), (-1, 1), (0, -2), (0, -1), (0, 0), (0, 1), (0, 2), (1, -1), (1, 0), (1, 1), (2, 0)]
*la liste est ordonnée lexicographiquement*
==
before==
def carre_complexe(x,y):
    return x*x+y*y,2*x*y

def nb_carre_Gauss(r):
    if r<0:
        return 0
    if r==0:
        return 1
    mod=int(r**2)

def nb_carre_Gauss(r):
    if r<0:
        return 0
    if r==0:
        return 1
    mod=int(r**2)
    l=[]
    for a in range(-mod,mod+1):
        for b in range(-mod,mod+1):
            x,y=carre_complexe(a,b)
            if x*x + y*y <= r*r:
               l.append((a,b))
    return l
import random

n=random.randint(4,12)

pltest3=""">>> nb_carre_Gauss({})\n'{}'""".format(n, nb_carre_Gauss(n))

after=before
==



pltest0==
>>> nb_carre_Gauss(1.1)==
True
==
pltest1==
#negatif
>>> coefficients_binome(-9)
'non défini'
==

pltest2==
>>> coefficients_binome(5)
'1 5 10 10 5 1'
==






