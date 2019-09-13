# OCE : test 11/09/2019 OK

# Copyright 2017 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz
name=Variables et Types
title= Variables et Types
tag= int|str|type|litteral|variable

# je ne suis pas sur d'avoir besoin de ca FIXME
extends=/ComputerScience/python/template/pltest.pl

# presentation des variables
text=@ presvar.md

text+=

# Enoncé
Exercice : définisez une variable **entier** entière c'est à dire de type &lt;class "int"&gt;.

Une variable **bob** réelle de type &lt;class "float"&gt;.

Une variable **nom** contenant une chaine de caractère c-à-d  de type  &lt;class "str"&gt;.

==
code==
# Ceci est un commentaire
# creez vos trois variables sur les lignes suivantes
# une variable par ligne
bob=nom=entier=33
==

pltest==
>>> type(entier)# Verification entier est de type int 
<class 'int'>
>>> type(bob) # Verification bob est de type float
<class 'float'>
>>> type(nom) # Verification nom est de type str
<class 'str'>
==





