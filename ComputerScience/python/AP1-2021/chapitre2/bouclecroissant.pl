

author=Zip
# Valide dr

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=InstructionsRepetitives|ForInRange

title = Saisie d'une suite croissante


text==  

Ecrire un programme qui lit une suite de chaines de caractères tant qu'elles 
forment une suite strictement croissante. 

Lorsque la suite n'est plus croissante, la saisie s'arrête et 
le programme affiche la longueur de la suite croissante.
==

code==
# Utilisez 
# input("Valeur :")
# pour faire vos input 

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
mplsoluce4 += str(v-10)+"\n"
==

# dr soluce qui marche avec des chaines ;)
soluce==
nb=1
prev=input("Valeur :")
next=input("Valeur :")
while prev<next:
    prev,next = next, input("Valeur :")
    nb+=1

print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==


zipsoluce==
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
5 Valeurs
2 
3
5
14
77
0
==
mplsoluce1==
Une seul
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


mplsoluce5==
Des chaines
annanas
bannana
papel
mango
==







