



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =liste palindrome
text==  
On appelle "palindrome" un mot qui reste identique qu'on le lise de gauche à droite ou de droite à gauche, comme "eve"
ou "laval".<br>
Appiqué aux listes, une liste palindrome est une liste qui reste identique
 qu'elle soit parcourue par indices croissants ou par indices décroissants, comme ["un",4,['\',1],4,"un"].<br>
 Ecrire une fonction `est_palindrome(lst)` qui reçoit une liste lst et renvoie True si lst est une liste palindrome, et False sinon.<br>
 Ecrire une fonction `devient_palindrome(lst)` qui reçoit une liste lst et la transforme en liste palindrome
en ajoutant en fin de liste ses propres éléments en ordre inverse.<br>
    >>> est_palindrome([1,2,3,2,1])<br>
    True<br>
    >>> est_palindrome([12,43,34,21])<br>
    False<br>
    >>> l=[12,43,34,21]<br>
    >>>> devient_palindrome(l)<br>
    >>> print(l)<br>
    [12,43,34,21,21,34,43,12]<br>
remarque : pour parfaire votre entrainement, l'usage des méthodes existantes `reverse` et `extend` est interdit!
==
taboo=reverse,extend
before==
def est_palindrome(lst):
    for i in range(len(lst)//2):
        if lst[i]!= lst[len(lst)-i-1]:
            return False
    return True
def devient_palindrome(lst):
    for i in range(len(lst)-1,-1,-1):
       lst.append(lst[i])

import random
lst=[1,"to",42,[12,21],"bla",10,17]
lg=random.randint(0,15)
pal=[]
for i in range(lg):
    n=random.randint(0,6)
    pal.append(lst[n])

choix=random.randint(0,1)
if choix==0:
    devient_palindrome(pal)

pltest3=""">>> est_palindrome({})\n{}""".format(pal,est_palindrome(pal))

after=before
==



pltest0==
>>> est_palindrome([10,54,10])==True
True
==
pltest1==
est_palindrome([10,'koko",1])
>>> False
==
pltest2==
>>> devient_palindrome([1,2,"palindrome"]
[1,2,"palindrome","palindrome",2,1]
==

