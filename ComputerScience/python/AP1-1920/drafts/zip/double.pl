
author=Zip


# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = nombres croissants


text==  

Ecrire un programme qui force la saisie d'un entier strictement positif
 puis affiche un suite de lignes formées de:
1 sur la première ligne
1 2 sur la deuxième ligne
1 2 3 sur la troisième

1 2 3     n sur la dernière.
exemple
Entrez un entier strictement positf: 0
Entrez un entier strictement positif: 5
1
12
123
1234
12345
==

code==

int(input("Entrez un entier strictement positf: "))
==

before==
import random
N=random.randint(3)
mplsoluce3="Test aléatoire\n"
for i in range(N):
    v =-random.randint(0,6)
    mplsoluce3 += str(v)+"\n"
v =random.randint(1, 6)
mplsoluce3 += str(v)
==

soluce==
nb=-1
while nb <1:
    nb=int(input("Entrez un entier strictement positf: "))
for i range(nb):
    s=""
    for j in range(1,i):
        s+=str(j)
    print(s)
    

==


mplsoluce0==
Entrée ok
5
==
mplsoluce1==
Une seul faux
-4
3
==
mplsoluce2==
une ligne
1
1
==



