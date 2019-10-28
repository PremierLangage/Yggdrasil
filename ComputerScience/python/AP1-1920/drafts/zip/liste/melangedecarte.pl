# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Shuffle
text==
on veut simuler le mélange d'un jeu de 52 cartes représenté par la lisre des entiers de 0 à 51.<br>
 la méthode de mélange de cartes consiste à:<br>
répéter n fois
    couper le paquet en deux parties égales
    fusionner en alternant un carte de chaque paquet (et en commencant par un paquet aléatoire)
   
   Ecrire une fonction  `fusion(l1,l2)` qui reçoit deux listes et renvoie la liste obtenue par la fusion des deux listes.<br>

   Ecrire une fonction  `melange(n)` qui renvoie la liste représentant un jeu de 52 cartes obtenue après n répétitions de (coupe,fusion)
    à partir de la liste [0,1,...,51].
    'pour les besoins de correction,on fixe la suite pseudo aléatoire fournie par random.randint en précisant
     son point de départ grace à random.seed(), ici on choisit  random.seed(42)
==
editor.code==
import random
random.seed(42)
==
before==
import random
random.seed(42)
def coupe(l):
    m=len(l)//2
    if m>4:
        m=random.randint(m-2,m+2)
    print("coupe",m)
    return l[:m],l[m:]

def melange(l1,l2):
    n=random.randint(0,1)
    if n==0:
        u=l1
        d=l2
    else:
        u=l2
        d=l1
    m=[]
    lmin=min(len(u),len(d))
    for i in range(lmin):
        m.append(u[i])
        m.append(d[i])
    m+=u[lmin:]+d[lmin:]
    return m


==
pltest0=
>>> fusion([0,1,2][3,4,5])

