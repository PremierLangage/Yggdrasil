# OCE 10/09/2019 : KO

# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Lecture et Validation 
tag= print|input
template=plbank:/python/0PLG/soluce
text==

Il faut lire 3 entiers jour,mois,annee et valider qu'ils sont bien dans les intervals suivant:

    jour entre 1 et 31
    mois entre 1 et 12
    annee strictement positif 

Pour une entrée de

    34 12 4000

affiche

    34 n'est pas une valeur de jour correct

Pour une entrée de

    31 18 4000

affiche

    18 n'est pas une valeur de mois correct

Pour une entrée de

    31 11 -4000

affiche

    -4000 n'est pas une valeur d'annee correcte



==

code==
jour=int(input())
mois=int(input())
annee=int(input())

    print(jour," n'est pas une valeur de jour correct")
    print(mois," n'est pas une valeur de mois correct")
    print(annee," n'est pas une valeur d'annee correcte")

==

input0==
32
17
-4000
==
input1==
31
17
-4000
==
input2==
3
10
-4000
==
input3==
3
11
4000
==

soluce==
jour=int(input())
mois=int(input())
annee=int(input())

if not 0< jour <32 :
    print(jour," n'est pas une valeur de jour correct")
elif not 0<mois<13:
    print(mois," n'est pas une valeur de mois correct")
elif not 0<annee:
    print(annee," n'est pas une valeur d'annee correcte")



==


