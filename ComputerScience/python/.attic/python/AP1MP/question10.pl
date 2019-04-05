# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Conclusion
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# En Déduire 

Déduire des questions précédente le numéro du jour J/M/A  depuis le 1/1/1,
et sachant que le 1/1/1 est un lundi afficher le nom du jour de la semaine de J/M/A.


Exemple :

    Le 29/12/2014 est le jour numéro 363 de l'année 2014.
    C'est le jour numéro 735596 de notre ère.
    C'est un lundi.
   

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

print("Le",jour,"/",mois,"/",annee," est le jour numéro",nbj," de l'année ", annee,".")

nbj+=jour

nbjpjanv=365.25*annee

nbj +=  nbjpjanv

print("C'est le jour numéro",nbj,"de notre ère.")

nomjours=["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche"]
print("C'est un ",nomjours[nbj%7],".")

==

input0==
29
12
2014
==

#input1==
#29
#3
#2000
#==

#input2==
#31
#7
#0400
#==

#input3==
#29
#9
#2301
#==

#input4==
#29
#12
#2311
#==

#input5==
#29
#12
#2004
#==
