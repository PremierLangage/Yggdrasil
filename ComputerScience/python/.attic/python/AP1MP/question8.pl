# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Jours de puis le nouvel an.
tag= print|input|if
template=plbank:/python/0PLG/soluce
text==

# Premier jour du mois

Déterminer le nombre de jours écoulés entre le premier janvier de l’année saisie et le premier
jour du mois saisi (non compris), et afficher un message du type

    Il s'est écoulé ... jours entre le 1/1/A et le 1/ M /A.

exemple:

    Il s'est écoulé 31 jours entre le 1/1/1 et le 1/ 2 /2014 .

==

code==
jour=int(input())
mois=int(input())
annee=int(input())

"Il s'est écoulé 31 jours entre le 1/1/1 et le 1/ 2 /2014 ."



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

print("Il s'est écoulé ",nbj," jours entre le 1/1/",annee," et le 1/",mois,"/",annee,".")

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
