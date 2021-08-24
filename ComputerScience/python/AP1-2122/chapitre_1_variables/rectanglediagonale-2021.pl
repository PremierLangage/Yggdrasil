

# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Diagonale d'un rectangle

tag=input|print|puissance

text==  
Ecrire un programme qui lit les dimensions d'un rectangle au clavier, puis calcule et affiche le périmètre et la surface du rectangle ainsi que
la longueur de la diagonale sous la forme :

Le périmètre est ?? et la surface est ?? ! 

La diagonale mesure ?? !
(Pensez à **)

<u>**Information**</u> : Le programme testeur fournira les deux valeurs pour évaluation. 
==

soluce==
l=int(input())
la=int(input())
print("Le périmètre est",2*(l+la),"et la surface est",l*la,"!")
print("La diagonale mesure",(l*l+la*la)**0.5,"!")
==
mplsoluce0==
essai1
2 
3
==

mplsoluce1==
essai1
2 
3
==
before=

