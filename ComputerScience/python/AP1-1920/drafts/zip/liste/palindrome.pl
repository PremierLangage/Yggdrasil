



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =liste palindrome
text==  
On appelle "palindrome" un mot qui reste identique qu'on le lise de gauche à droite ou de droite à gauche, comme "eve"
ou "laval".<br>
Appiqué aux listes, un liste palindrome est une liste qui reste identique
 qu'elle soit parcourue par indices croissants ou par ar indices décroissants, comme ["un",4,['\',1],4,"un"].<br>
 Ecrire une fonction 'est_palindrome(lst)' qui reçoit une liste lst et renvoie True si lst est une liste palindrome, et False sinon.
 Ecrire une fonction 'devient_palindrome(lst)' qui reçoit une liste lst et la transforme en liste palindrome
en ajoutant en fin de liste ses propres éléments en ordre inverse.
    >>> est_palindrome([1,2,3,2,1])
    True
    >>> est_palindrome([12,43,34,21])
    False
    >>> l=[12,43,34,21]
    >>>> devient_palindrome(l)
    >>> print(l)
    [12,43,34,21,21,34,43,12]
remarque : pour parfaire votre entrainement, l'usage des méthodes existantes 'reverse' et 'extends' est interdit!
==
Xbefore==
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

