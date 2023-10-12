
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=InstructionsRepetitives|ForInRange|for


title = Liste des diviseurs

code==
??? = int(input("Un nombre : "))



==

before==

==

text==  

Ecrire un programme qui lit un entier strictement positif et affiche,
 **un** par **ligne**, chacun de ses diviseurs en ordre croissant.
Le programme affiche ensuite le nombre de diviseurs.

**Si l'entier est négatif ou nul, on ne fait rien !**

**Exemple :**

Un nombre : 6

1

2

3

6

6 a 4 diviseurs
==


soluce==
n=int(input("Un nombre : "))
if n>=1:
    nbdiv=0
    for div in range(1,n+1):
        if n%div ==0:
            print(div)
            nbdiv+=1
    print(str(n) + " a " + str(nbdiv) + " diviseurs")
==
plsoluce==
Peu nombreux | 6 
Invalide | 0
Invalide aussi |-42
long | 114593
Nombreux | 510510 
==










