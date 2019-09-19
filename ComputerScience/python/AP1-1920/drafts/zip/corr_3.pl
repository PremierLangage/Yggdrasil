
author=Dominique Revuz
 
tag=error|print
title= Corrige Moi !
name= Plus
extends=/ComputerScience/python/template/soluce.pl
text==

text==

Le programme python si dessous contient une erreur corrigez la pour passer à l'exercice suivant.

==

code==

print('la somme de 15975 et 43242 est '+ 15975+43242)

==
plsoluce==
la somme de 15975 et 43242 est  59217

==

soluce==
print('la somme de 15975 et 43242 est  59217')

==
compilehelp==
print doit d'abord déterminer cequ'il doit afficher.
Or python ne sait pas additionner des textes et des nombres.
(La chaine 'la somme de 15975 et 43242 est ' est de type str alors que 15975+43242 est de type int)
Le message d'erreur vous dit qu'il ne peut transformer le nombre 'int' (integer) en texte 'str' string (chaine de caractères), **implicitement**.
Implicitement c'est que vous ne l'avez pas demandé explicitement.
Pour le demander explictement il faut écrire : 
print("la somme de 15975 et 43242 est "+ str(15975+43242))
ou alors demander à print de faire le travail en séparant les deux éléments à afficher
print("la somme de 15975 et 43242 est ", 15975+43242)
en utilisant une virgule pour séparer les paramêtres d'appel de print.
==

Xidden==
>>> print("la somme de 15975 et 43242 est "+ 15975+43242)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: Can't convert 'int' object to str implicitly
>>>
==



 
