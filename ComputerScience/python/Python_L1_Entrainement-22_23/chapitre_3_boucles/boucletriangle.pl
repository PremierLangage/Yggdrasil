
tag=boucle|type|saisieControlee|while|ForInRange

author=

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = nombres croissants


text==  

Ecrire un programme qui force la saisie d'un entier strictement positif
 puis affiche une suite de lignes formées de:
 
1 sur la première ligne

1 2 sur la deuxième ligne

1 2 3 sur la troisième

1 2 3 ... n sur la dernière.

exemple:


Entrez un entier strictement positif: -2

Entrez un entier strictement positif: 5

1

12

123

1234

12345
==

code==
int(input("Entrez un entier strictement positif: "))
==

before==
import random
N=random.randint(1,3)
mplsoluce3="Test aléatoire\n"
for i in range(N):
    v =-random.randint(0,6)
    mplsoluce3 += str(v)+"\n"
v =random.randint(1, 6)
mplsoluce3 += str(v)
==

soluce==
nb=int(input("Entrez un entier strictement positif: "))
while nb <1:
    nb=int(input("Entrez un entier strictement positif: "))
for i in range(nb):
    s=""
    for j in range(i+1):
        s+=str(j+1)
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










