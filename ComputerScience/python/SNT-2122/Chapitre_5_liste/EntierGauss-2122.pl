# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Entiers de Gauss

text==  

On appelle "entier de Gauss" un nombre complexe $%z=a+\mathrm{i}b , (a,b) \in \mathbb{N}^2 %$


Ecrire une fonction `carres_Gauss(r)` qui renvoie la liste d'entiers de Gauss dont le module de son **carré** (i.e. de $% (a^2 - b^2) + 2ab\mathrm{i} %$) est **inférieur ou égal** à $%r%$.
La liste retournée est une liste de ces entiers de Gauss représentés en couples (a, b), ordonnées **lexicographiquement**, _i.e._ ascendant en première coordonnée, puis ascendant en deuxième coordonnée. 

<pre><code>
>>> carres_Gauss(2)
[(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 0), (0, 1), (1, -1), (1, 0), (1, 1)]
</code></pre>

==

tag=append|ForInRange|tuple|math

before==
def carre_complexe(x,y):
    return x*x-y*y,2*x*y

def carres_Gauss_ancien(r):
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
    
def carres_Gauss(n):
    res = []
    for x in range(-n, n + 1):
        for y in range(-n, n + 1):
            if x*x + y*y <= n:
                res.append((x, y))
    return res

import random

n=random.randint(-4,14)

pltest3=f">>> carres_Gauss({n})\n{carres_Gauss(n)}"

n=random.randint(-4,14)

pltest4=f">>> carres_Gauss({n})\n{carres_Gauss(n)}"

n=random.randint(-4,14)

pltest5=f">>> carres_Gauss({n})\n{carres_Gauss(n)}"

n=random.randint(-4,14)

pltest6=f">>> carres_Gauss({n})\n{carres_Gauss(n)}"

after=before
==



pltest0==
>>> carres_Gauss(1)
[(-1, 0), (0, -1), (0, 0), (0, 1), (1, 0)]
==
pltest1==
>>> carres_Gauss(15)
[(-3, -2), (-3, -1), (-3, 0), (-3, 1), (-3, 2), (-2, -3), (-2, -2), (-2, -1), (-2, 0), (-2, 1), (-2, 2), (-2, 3), (-1, -3), (-1, -2), (-1, -1), (-1, 0), (-1, 1), (-1, 2), (-1, 3), (0, -3), (0, -2), (0, -1), (0, 0), (0, 1), (0, 2), (0, 3), (1, -3), (1, -2), (1, -1), (1, 0), (1, 1), (1, 2), (1, 3), (2, -3), (2, -2), (2, -1), (2, 0), (2, 1), (2, 2), (2, 3), (3, -2), (3, -1), (3, 0), (3, 1), (3, 2)]
==

pltest2==
>>> carres_Gauss(0)
[(0, 0)]
==



















