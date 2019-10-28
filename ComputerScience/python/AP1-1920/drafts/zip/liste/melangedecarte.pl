# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Shuffle
text==
on veut simuler le mélange d'un jeu de 52 cartes représenté par la lisre des entiers de 0 à 51.<br>
 la méthode de mélange de cartes consiste à:<br>
répéter n fois :<br>
    couper le paquet en deux parties égales<br>
    fusionner en alternant un carte de chaque paquet (et en commencant par un paquet aléatoire)<br>
   Ecrire une fonction  `fusion(l1,l2)` qui reçoit deux listes et renvoie la liste obtenue par la fusion des deux listes.<br>

   Ecrire une fonction  `melange(n)` qui renvoie la liste représentant un jeu de 52 cartes obtenue après n répétitions de (coupe,fusion)
    à partir de la liste [0,1,...,51].<br>
    *Pour les besoins de correction, on fixe la suite pseudo aléatoire fournie par random.randint en précisant
     son point de départ grace à random.seed(), ici on choisit  random.seed(42)*
==
editor.code==
import random
random.seed(42)
==
before==
import random
random.seed(42)
def coupe(l):
    """ suppose len(l) pair
    """
    m=len(l)//2
    return l[:m],l[m:]

def fusion(l1,l2):
    n=random.randint(0,1)
    if n==0:
        u=l1
        d=l2
    else:
        u=l2
        d=l1
    m=[]
    
    for i in range(lmin):
        m.append(u[i])
        m.append(d[i])
   
    return m

def melange(n):
    l=list(range(52))
    for i in range(n):
        l1,l2=coupe(l)
        l=fusion(l1,l2)
    return l

==
pltest0==
>>> fusion([0,1,2],[3,4,5])==[0, 3, 1, 4, 2, 5]
True
==
pltest1==
>>> melange(4)
[32, 48, 0, 16, 45, 10, 13, 29, 7, 23, 26, 42, 20, 36, 39, 4, 33, 49, 1, 17, 46, 11, 14, 30, 8, 24, 27, 43, 21, 37, 40, 5, 34, 50, 2, 18, 47, 12, 15, 31, 9, 25, 28, 44, 22, 38, 41, 6, 35, 51, 3, 19]

