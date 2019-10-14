
#author=Zip


# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Points du disque


text==  

Ecrire un programme qui force la saisie d'un réel strictement positif d
 puis affiche le nombre de points à coordonnées entières situés à l'intérieur le disque de rayon d.
exemple


Entrez un réel strictement positf: -2

Entrez un réel strictement positif: 24.32
Il y a 1861 points à coordonnées entières

==

code==

??=float(input("Entrez un réelstrictement positf: "))



==

before==
import random
d=random.randint(92,10000)
d=d/100
mplsoluce3="Test aléatoire\n"
mplsoluce3 += str(d)+"\n"

==

soluce==


d=float(input("Entrez un réel strictement positf: "))
while d<=0:
    d=float(input("Entrez un réel strictement positf: "))
x=0
nb=0
while x<=d:
    y=0
    while y<=d:
        if x*x+y*y<d*d:
            if x==0 and y==0:
                nb+=1
            elif x==0 or y==0:
                nb+=2
            else  :
                nb+=4
        y+=1
    x+=1
print("Il y a",nb,"points à coordonnées entières")
==


mplsoluce0==
Entrée ok
5.5
==
mplsoluce1==
Entrée négative
-1.5
1
==
mplsoluce2==
Entrée grande
24
==


