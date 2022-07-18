
extends = /ComputerScience/python/template/pltest.pl

title= Caractère minuscule 

text==


Ecrire une fonction **est_minuscule(carac)** qui renvoie un booléen pour indiquer que le caractère `carac` est entièrement en minuscule. 

On considérera que la chaine de caractère carac est composé d'un unique caractères ASCII.

Les méthodes isupper() et islower() sont interdites. On utilisera les points de code.

==

taboo=isupper|islower

pltest==
>>> est_minuscule("b")
True
>>> est_minuscule("B")
False
>>> est_minuscule("z")
True
==
