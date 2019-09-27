

# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Diagonale d'un rectangle


text==  
Les dimensions d'un rectangle sont entrées par l'utilisateur, le programme testeur fournira les deux valeurs.

Ecrire un programme qui calcule et affiche le périmètre et la surface du rectangle puis
la longueur de la diagonale
sous la forme :

Le périmètre est ?? et la surface est ?? ,
la diagonale mesure ?? .
(pensez à **)
==

soluce==
l=int(input())
la=int(input())
print("Le périmètre est",2*(l+la),"et la surface est",l*la,",")
print("la diagonale mesure",(l*l+la*la)**0.5,".")
==
mplsoluce0==
essai1
2 
3
==


