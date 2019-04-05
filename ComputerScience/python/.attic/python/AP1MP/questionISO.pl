# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= ISO (optionel)
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# Calendrier ISO 

Une fois que vous vous êtes informés sur la page wikipedia:

[https://fr.wikipedia.org/wiki/Num%C3%A9rotation_ISO_des_semaines](https://fr.wikipedia.org/wiki/Num%C3%A9rotation_ISO_des_semaines)

afficher pour la date donnée les informations suivantes:

    "C'est le jour X de la semaine Y de l'année ISO Z"

En particulier pour le 29/12/2014 l'affichage est 

    c'est le jours 1 de la semaine 1 de l'année ISO 2015

Réutiliser le code des questions précédentes.

==

code==
jour=int(input())
mois=int(input())
annee=int(input())


    "C'est le jour X de la semaine Y de l'année ISO Z"

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

nbjpjanv=365.25*annee

nbj +=  nbjpjanv


print("C'est le jour X de la semaine Y de l'année ISO Z")


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
30
12
2301
==

input4==
2
1
2013
==

input5==
29
12
2004
==
