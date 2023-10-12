# author FLQ

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=InstructionsRepetitives|While


title = Suite de Syracuse

code==
# utilisez l'input suivant : 
input("Un nombre : ")

==

before==

==

text==  
On appelle suite de Syracuse une suite d’entiers naturels définie de la manière suivante :  

    On part d’un nombre entier plus grand que zéro  
    s’il est pair, on le divise par 2 ;
    s’il est impair, on le multiplie par 3 et on ajoute 1.

Cette suite atteint 1 quelle que soit la valeur initiale. (Ceci n'a jamais été démontré !!!)

Ecrire un programme qui lit un entier naturel et qui calcule et affiche les éléments de la suite jusqu'a atteindre la valeur 1 (incluse).

**La suite n'est pas définie pour les nombres négatif ou nul**.   
Dans ce cas la il faut afficher : "indéfinie".   
Attention l'absence de ce test crée une boucle infinie? (a démontrer ...).


<a href="https://fr.wikipedia.org/wiki/Conjecture_de_Syracuse"> Plus d'info sur Syracuse.</a>
==

soluce==
n=int(input("Un nombre : "))
if n>0:
	print(n)
	while (n !=1) :
		if ((n%2)==0) :
			n=n/2
		else : 
			n=3*n+1
		print(n)
else:
	print("indéfinie")

==
plsoluce==
Test basique | 22
Controle du zéro | 0
Controle cas négatif | -3
Test plus long | 2000
==




