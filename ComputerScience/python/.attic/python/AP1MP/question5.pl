# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Jour du Mois correct
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# Vérification de la date

Vérifier que la date est correcte.

C'est à dire que le jours dans le mois est correcte par rapport au mois.

Pour 30/02/2000 le programme affiche :

    date incorrecte.

Remarque:
    vous pouvez recopier le code de la question précédente.

==

code==
jour=int(input())
mois=int(input())
annee=int(input())

    print("date incorrecte.")
==

input0==
30
2
1964
==

input1==
29
2
2000
==

input2==
31
5
0400
==

input3==
29
2
1301
==

soluce==
jour=int(input())
mois=int(input())
annee=int(input())

bissextile = annee % 400==0 or ( annee % 4== 0 and  not annee % 100 == 0 )

if (mois <8 and mois%2==1) or (mois >7 and mois%2==0):
    if not 0<jour <32:
        print(jour,"/",mois,"/",annee,"date incorrecte.")
elif mois != 2:
    if not 0<jour <31:
        print(jour,"/",mois,"/",annee,"date incorrecte.")
else:
    if bissextile :
        if not 0<jour <30:
            print(jour,"/",mois,"/",annee,"date incorrecte.")
    else:
        if not 0<jour <29:
            print(jour,"/",mois,"/",annee,"date incorrecte.")

==



