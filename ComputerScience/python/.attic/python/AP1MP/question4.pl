# OCE 10/09/2019 : KO
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Nombre de jours
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# le nombre de jours du Mois

Calculer  le nombre de jours du mois saisie.

Puis afficher 


    "Le mois 3/1777 compte 31 jours"

Bien sur il faut pour le mois de Février indiquer 28 ou 29 en fonction du fait que l'année est bissextile ou pas.

==

code==
jour=int(input())
mois=int(input())
annee=int(input())

    print("Le mois",mois,"/",annee,"compte ",29,"jours.")
==

input0==
2
2
1964
==

input1==
3
2
2000
==

input2==
3
3
0400
==

input3==
3
11
300
==

soluce==
jour=int(input())
mois=int(input())
annee=int(input())

bissextile= ( annee % 400==0 or ( annee % 4== 0 and  not annee % 100 == 0 ))

if (mois <8 and mois%2==1) or (mois >7 and mois%2==0):
    print("Le mois",mois,"/",annee,"compte ",31,"jours.")
elif mois != 2:
    print("Le mois",mois,"/",annee,"compte ",30,"jours.")
else:
    if bissextile :
        print("Le mois",mois,"/",annee,"compte ",29,"jours.")
    else:
        print("Le mois",mois,"/",annee,"compte ",29,"jours.")


==


