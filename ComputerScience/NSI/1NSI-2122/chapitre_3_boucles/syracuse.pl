# author FLQ

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=InstructionsRepetitives|While


title = Suite de Syracuse

code==


==

before==

==

text==  
On appelle suite de Syracuse une suite d’entiers naturels définie de la manière suivante : On
part d’un nombre entier plus grand que zéro ; s’il est pair, on le divise par 2 ;
 s’il est impair, on le multiplie par 3 et on ajoute 1.

Cette suite atteint 1 quelle que soit la valeur initiale. (Ceci n'a jamais été démontré !!!)

Ecrire un programme qui lit un entier naturel et qui calcule et affiche les éléments de la suite jusqu'a atteindre la valeur 1 (incluse).

**Le code ne doit rien faire quand l'entrée n'est pas valide !**

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
==
plsoluce==
Test | 22
de zéro | 0
de neg |-3
==




