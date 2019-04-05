# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= depuis le premier jour
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# Combien de jours depuis le premier jour

Déterminer le nombre de jours écoulés entre le 01/01/01 (le “premier jour”) et le premier
janvier de l’année choisie (non compris), et afficher un message du type :

    Il s'est écoulé XXX jours entre le 1/1/1 et le 1/1/A.

Par exemple :

    Il s'est écoulé 365 jours entre le 1/1/1 et le 1/1/2.

    Il s'est écoulé 735233 jours entre le 1/1/1 et le 1/1/2014.


Attention: il faut un nombre entier de jours.
==

code==
jour=int(input())
mois=int(input())
annee=int(input())

"Il s'est écoulé 735233 jours entre le 1/1/1 et le 1/1/ 2014 ."



==


soluce==
jour=int(input())
mois=int(input())
annee=int(input())


print("Il s'est écoulé ",int(365.25*annee)," jours entre le 1/1/1 et le 1/1/",annee,".")

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
9
2301
==

