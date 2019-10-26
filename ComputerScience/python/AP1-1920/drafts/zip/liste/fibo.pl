



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Entiers de Gauss
text==  

On appelle "entier de Gauss" un nombre complexe $%z=a+\mathrm{i}b , a,b \in \mathbb{Z} %$

Ecrire une fonction *disque_Gauss(r)* qui recoit un nombre réel r et.renvoie la liste  des entiers de Gauss (de module inférieur à $%r%$) 
dont le carré est également un entier de Gauss de module inférieur à $%r%$. La liste est une liste de couples
  >>>disque_Gauss(2)<br>
[(-2, 0), (-1, -1), (-1, 0), (-1, 1), (0, -2), (0, -1), (0, 0), (0, 1), (0, 2), (1, -1), (1, 0), (1, 1), (2, 0)]<br>
<*la liste est ordonnée lexicographiquement*
==
before==
def carre_complexe(x,y):
    return x*x+y*y,2*x*y

def disque_Gauss(r):
    if r<0:
        return []
    if r==0:
        return [(0,0)]
    mod=int(r**2)
    l=[]
    for a in range(-mod,mod+1):
        for b in range(-mod,mod+1):
            x,y=carre_complexe(a,b)
            if x*x + y*y <= r*r:
               l.append((a,b))
    return l

import random

n=random.randint(11,21)
n=n+0.2
pltest4=""">>> disque_Gauss({})\n'{}'""".format(n,disque_Gauss(n))

after=before
==



pltest0==
>>> disque_Gauss(1.1)==[(-1, 0), (0, -1), (0, 0), (0, 1), (1, 0)]
True
==
pltest1==
negatif
>>> disque_Gauss(-9)
[]
==
pltest2==
>>> carres_Gauss(1.1)
[(-1, 0), (0, -1), (0, 0), (0, 1), (1, 0)]
==
>>> carres_Gauss(15)
[(-3, -1), (-3, 0), (-3, 1), (-2, -2), (-2, -1), (-2, 0), (-2, 1), (-2, 2), (-1, -3), (-1, -2), (-1, -1), (-1, 0), (-1, 1), (-1, 2), (-1, 3), (0, -3), (0, -2), (0, -1), (0, 0), (0, 1), (0, 2), (0, 3), (1, -3), (1, -2), (1, -1), (1, 0), (1, 1), (1, 2), (1, 3), (2, -2), (2, -1), (2, 0), (2, 1), (2, 2), (3, -1), (3, 0), (3, 1)]
==





