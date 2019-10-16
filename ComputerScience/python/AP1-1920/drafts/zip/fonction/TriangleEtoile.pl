

# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title =triangle étoilé
text==  
on veut dessiner à l'aide d'étoiles '*' et de plus "+" des triangles de la forme
*
*+**
*+**+***
*+**
*


* 
Pour cela:
* écrire une fonction *ligne_etoile(n)* qui reçoit un entier
et renvoie une chaine formée de : <br>
1 caractère étoile ('\*'), 2 caractères étoile ('\*'),...,n caractères étoile ('*') séparés par des caratères plus ('+').<br>
    si elle reçoit 4 elle renvoie "*+**+***+****".<br>
    si elle reçoit 1 elle renvoie "*"
    si elle reçoit un entier inférieure à 1 elle renvoie la chaine vide.

* utilisez cette fonction pour écrire un programme qui lit un entier n et si n est >0 et affiche le triangle
qui contient une suite de n "*"

Exemple
 
Entrez un entier : 5 <br>
*<br>
*+**<br>
*+**+***<br>
*+**+***+****<br>
*+**+***+****+*****<br>
*+**+***+****<br>
*+**+***<br>
*+**<br>
*<br>
==
before==
import random

mplsoluce2="Test aléatoire\n"
n=random.randint(4,7)
mplsoluce2 += str(n)+"\n"
==

soluce==

def desEtoiles(n):
    s=""
    if n>0:
        s="*"
        etoile="*"
        if n>1:
            for i in range(n-1):
                etoile+="*"
                s=s+"+"+etoile
        
    return s

n=int(input())
for i in range(1,n+1):
    print(desEtoiles(i))
for i in range(n-1):
    print(desEtoiles(n-1-i))
==
mplsoluce0==
classique
3
==
mplsoluce1==
negatif
-9
==






