




# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

a=3
b=4

title =Suite récurente d'ordre 2
text==  

On appelle "Suite une suite récurente d'ordre 2" une suite d'entier définie par <br>
$%f_0=0%$<br>
$%f_1=1%$<br>
$%f_{n+2}= a \times  f_{n+1}+b \times f_{n}%$ avec  $% a,b \in \mathbb{R}^2 %$ <br>

Ecrire une fonction *suite(n)* qui recoit un nombre entier $%n%$ et renvoie la liste  des 
$%n%$ premiers nombres de la suite (de $%f_0%$ jusqu'à $%f_{n-1}%$) pour a={{a}} et b ={{b}}<br>

{{pltest0}}

==
before==
def suite(n):
    if n<=0:
        return []
    if n==1:    
        return [0]
    if n==2:
        return [0,1]
    l=[0,1]
    for i in range(2,n):
        l.append(a*l[i-1]+b*l[i-2])
    return l
import random

n=random.randint(11,51)

pltest3=""">>> suite({})\n{}""".format(n,suite(n))

after=before
==



pltest0==
>>> fibo(2)==[0, 1]
True
==
pltest1==
>>> fibo(-9)
[]
==
pltest2==
>>> fibo(11)
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
==







