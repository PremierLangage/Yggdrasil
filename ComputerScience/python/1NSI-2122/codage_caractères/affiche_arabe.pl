
extends = /ComputerScience/python/template/pltest.pl

title= Affiche caractères arabes 

text==


Ecrire une fonction **affiche_arabe()** qui affiche tous les caractères arabe unicode.

Ces caractères sont sur le document [joint](https://unicode.org/charts/PDF/U0600.pdf) 

==

taboo=isupper|islower|

pltest==
>>> est_minuscule("b")
True
>>> est_minuscule("B")
False
>>> est_minuscule("z")
True
==

