



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Nombres chanceux
text==  
On appelle "Nombres chanceux" les nombres restant après l'application d'un crible 
sur la suite des entiers impairs strictement positifs.<br>
Contrairement à celui d'Eratostène, ce crible ne prend en compte 
que les entiers qui n'ont pas précédemment été rayé.<br>
Pour obtenir les nombres chanceux strictement inférieurs à $%26%$,<br> 
on part de la liste [1,3,5,7,9,11,13,15,17,19,21,23,25]<br>
 on considère initialement le deuxième nombre non rayé :3. <br>
 En partant du début de la liste on raye,en le remplaçant par 0, un nombre non rayé tous les 3.<br>
 La liste devient:<br>
[1,3,0,7,9,0,13,15,0,19,21,0,25]<br>
on considère ensuite le troisième nombre non rayé :7. <br>
 En partant du début de la liste on raye un nombre non rayé tous les 7.<br>
 la liste devient:<br>
[1,3,0,7,9,0,13,15,0,0,21,0,25]<br>
on considère maintenant le quatrième nombre non rayé :9. <br>
 En partant du début de la liste on raye un nombre non rayé tous les 9.<br>
 La liste est inchangé, on a trouvé tous 
 les nombres chanceux strictement inférieurs à $%26%$,<br>
[1,3,7,9,13,15,21,25]
==
before==
def trouve_non_nul(l,n):
    """ trouve le nieme nombre non nul de l,
    renvoie son indice
    renvoie None si un tel nombre n'est pas trouvé
    """
    compte=0
    for i in range(len(l)):
        if l[i]!=0:
            compte+=1
            if compte==n:
                return i
    return None

def supprime(l,pas):
    enleve=False
    compte=0
    for i in range(len(l)):
       if l[i]!=0:
            compte+=1
            if compte==pas:
                l[i]=0
                compte=0
                enleve=True
    return enleve

def chanceux(max):
    if max<2:
        return []
    l=[x for x in range(1,max,2)]
    enleve=True
    niem_chanceux=2
    elimine= trouve_non_nul(l,niem_chanceux)
    while elimine!=None and enleve:
        enleve=supprime(l,l[elimine])
        niem_chanceux+=1
        elimine=trouve_non_nul(l,niem_chanceux)
    l=[x for x in l if x!=0]
    return l
import random

n=random.randint(204,501)

pltest3=""">>> chanceux({})\n{}""".format(n,chanceux(n))

after=before
==



pltest0==
>>> chanceux(10)==[1,3,7,9]
True
==
pltest1==
>>> chanceux(-9)
[]
==
pltest2==
>>> chanceux(26)
[1, 3, 7, 9, 13, 15, 21, 25]
==





