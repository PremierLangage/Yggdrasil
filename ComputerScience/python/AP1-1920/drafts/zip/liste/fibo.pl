



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Suite de Fibonacci
text==  

On appelle "Suite de Fibonacci" la suite d'entier définie par <br>
%$f_0=0%$<br>
%$f_1=1%$<br>
%$f_{n+2}=f_{n+1}+f_{n}%$<br>
Ecrire une fonction *fibo)* qui recoit un nombre entier $%n%$ et.renvoie la liste  des 
nombres de la suite jusqu'à l'indice $%n%$
  >>>fibo(2)<br>
[0,1]<br>
>>>fibo(5)<br>
[0,1,1,2,5]<br>
>>>fibo(-2)<br>
[]<br>
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
>>> disque_Gauss(-9)
[]
==
pltest2==
>>> disque_Gauss(1.1)
[(-1, 0), (0, -1), (0, 0), (0, 1), (1, 0)]
==
pltest3==
>>> disque_Gauss(15)
[(-3, -1), (-3, 0), (-3, 1), (-2, -2), (-2, -1), (-2, 0), (-2, 1), (-2, 2), (-1, -3), (-1, -2), (-1, -1), (-1, 0), (-1, 1), (-1, 2), (-1, 3), (0, -3), (0, -2), (0, -1), (0, 0), (0, 1), (0, 2), (0, 3), (1, -3), (1, -2), (1, -1), (1, 0), (1, 1), (1, 2), (1, 3), (2, -2), (2, -1), (2, 0), (2, 1), (2, 2), (3, -1), (3, 0), (3, 1)]
==






