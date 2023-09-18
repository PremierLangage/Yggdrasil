



author= DR

# Heritage d'un type d'exercice 
extends=/python/AP1-2122/template/pltest2023.pl

tag=InstructionsRepetitives|ForInRange

title = Analyse d'une suite Finie d'entiers


text==  

Votre programme doit lire une suite d'entiers positifs et s'arreter sur le premier entier négatif ou nul. 

Puis doit afficher "croissante", "décroissante","constante", "indéterminée" en fonction de la proprété correspondante 
de la suite des entiers possitifs lus.

==

code==

CROISSANTE = "croissante"
DECROISSANTE= "décroissante"
CONSTANTE= "constante"
INDETERMINEE = "indéterminée"

==

before==

import random
u=1
crois=[ u:= u + random.randint(2,100) for i in range(20)]
decrois = [ u:= u + random.randint(2,100) for i in range(20)].reverse()
u = random.randint(56,178)
constante = [ u for i in range(67)]
inde = crois+decrois+constante 


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







