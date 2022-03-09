extends = /ComputerScience/python/template/pltest.pl

title= Texte minuscule 

text==


Ecrire une fonction **est_minuscule(texte)** qui renvoie un booléen pour indiquer que le texte est entièrement en minuscule. 

On considérera que la chaine de caractère texte est composé entièrement de caractères ASCII.

Les méthodes isupper() et islower() sont interdites. On utilisera les points de code.

==

taboo=isupper|islower

pltest==
>>> est_minuscule("bonjour")
True
>>> est_minuscule("")
True
>>> est_minuscule("Bonjour")
False
>>> est_minuscule("bonjour Bob")
False
==
