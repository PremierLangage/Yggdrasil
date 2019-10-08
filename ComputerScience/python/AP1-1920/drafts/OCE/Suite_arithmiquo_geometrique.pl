# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl
@ /builder/before.py [builder.py]

before==#|python|
==

title = Suite arithmético-géométrique

text==  
En utilisant une boucle "for in range", écrire un programme permettant d'afficher le Nème entier de la suite arithmético géométrique croissante suivante : 

Un+1 = aUn + b
avec Uo > 0,
a>1,
b>0

pour a et b vous prendrez les valeurs : 2 et 3
Pour N la valeur 100 et pour Uo la valeur 1
==

code== #|python|
# insérez votre code ici
print("le résultat est :",??)
==

taboo=while
needed=for

soluce== #|python|
a=2
b=3
N=100
U=1
for i in range(N):
    U += a*U + b
print("le résultat est :",U)
==

mplsoluce0==

==



