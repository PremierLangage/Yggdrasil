

# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title =suite croissante


text==  

Ecrire un programme qui lit une suite de valeurs strictement croissantes. 
Lorsque la suite n'est plus croissante, la saisie s'arrête entiers et 
le programme affiche la longueur de la suite croissante.
==
code==



print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==

before==
import random
N=random.randint(4,10)
mplsoluce4="Test aléatoire\n"
v=40
for i in range(N):
    v += random.randint(1,6)
    mplsoluce4 += str(v)+"\n"
mplsoluce4 += str(N)+"\n"
==

soluce==
nb=1
prec=int(input())
suiv=int(input())
while suiv> prec:
    nb+=1
    prec=suiv
    suiv=int(input())
print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==
mplsoluce0==
essai1
2 
3
5
14
77
0
==
mplsoluce1==
essai2
4
1
==
mplsoluce2==
Plateau
4
4
1
==

mplsoluce3==
Départ négatif
-4
4
2
2
==
