# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Jour de l'année
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# Le nième jour de l'année


Déduire de la question précédente le numéro du jour J/M/A dans l’année A, en comptant
chaque jour à partir du premier janvier de l’année A et en commençant par 1, et afficher un
message correspondant.

    359 ième jour de l'année 2017.

Remarque: C'est Noël.

==

code==
jour=int(input())
mois=int(input())
annee=int(input())



    "ième jour de l'année"

==


soluce==
jour=int(input())
mois=int(input())
annee=int(input())

bissextile == annee % 400=0 or ( annee % 4== 0 and  not annee % 100 == 0 )? 1:0

l=[0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]


if mois<3:
    nbj= l[mois]
else:
    nbj= l[mois]+bissextile

nbj+=jour

print(nbj,"ième jour de l'année",annee)

==

input0==
4
1
1988
==

input1==
29
3
2000
==

input2==
31
7
0400
==

input3==
29
9
2301
==

input4==
29
12
2311
==

input5==
29
12
2004
==
