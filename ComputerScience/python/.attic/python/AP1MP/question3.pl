# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= année bissextile
tag= print|input
template=plbank:/python/0PLG/soluce
text==

# Année Bissextile

Il faut lire 3 entiers jour,mois,annee et afficher :

    1064 est bissextile.

Si l'année est bissextile et

    1777 n'est pas bissextile.


==

code==
jour=int(input())
mois=int(input())
annee=int(input())

    print(annee," est bissextile.")
    print(annee," n'est pas bissextile.")
==

input0==
2
7
1964
==

input1==
3
7
2000
==

input2==
3
10
0400
==

input3==
3
11
300
==

soluce==
jour=int(input())
moi=int(input())
annee=int(input())

if annee % 400==0 or ( annee % 4== 0 and  annee % 100 != 0 ) :
    print(annee," est bissextile.")
else:
    print(annee," n'est pas bissextile.")

==

