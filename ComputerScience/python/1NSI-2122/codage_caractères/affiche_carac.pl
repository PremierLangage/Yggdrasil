extends = /ComputerScience/python/template/pltest.pl

title= Affiche minuscule 

text==


Ecrire une fonction **est_minuscule(texte)** qui renvoie un booléen pour indiquer que le texte est en minuscule. 
On considérera que la chaine de caractère texte est composé entièrement de caractères ASCII.

==


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
