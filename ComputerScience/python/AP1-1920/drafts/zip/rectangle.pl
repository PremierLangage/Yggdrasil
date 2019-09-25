
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/soluce.pl

title = rectangle fixe


text==  
Les dimensions d'un rectangle sont entrées par l'utilisateur (pl)

Ecrire un programme qui calcule et affiche le périmètre et la surface du rectangle
sous la forme :

le périmètre est ?? et la surface est ??
==

soluce==
l=int(input())
la=int(input())
print("le périmètre est",2*(l+la),"et la surface est",l*la,".")
==

plsoluce==
t|2 3
==
