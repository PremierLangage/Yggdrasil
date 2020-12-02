# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
name= Lire une liste
title=Lire une liste
tag=list|input|for
tog=listinput
extends=/ComputerScience/python/template/soluce.pl
text==
Cet exercice consiste à lire une liste depuis du clavier. Nous allons supposer que l'utilisateur va entrez une seule ligne de texte,
avec un espace entre chaque valeur de la liste par exemple :

	un deux 3 quatre fin

ce qui vas nous permettre de creer la liste:

	``['un','deux','3','quatre','fin']``

Pour cela il suffit de lire la ligne avec **input** puis la découper avec **split** qui créer une liste exactement comme nous le souhaitons.

Pour valider l'exercice, affichez la liste lue avec **print**. Il n'est **pas nécessaire** de créer une fonction.
==

soluce==
print(input().split())
==

inputgenerator==
l=['False', 'None', 'True', 'and', 'as', 'assert', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
from random import randint
print(" ".join([ l[randint(0,len(l)-1)] for j in range(randint(3,7))]))
==

showinput=True

nomberofgenerator=1

feedback==
Retenez bien ce code :
	input().split()
qui permet d'obtenir une liste à partir d'une chaine en la coupant à chaque espace.

par exemple :
	"Une chaine de caractères  <-ah j'ai mis deux espaces".split()
	['Une', 'chaine', 'de', 'caractères', '<-ah', "j'ai", 'mis', 'deux', 'espaces']
==



