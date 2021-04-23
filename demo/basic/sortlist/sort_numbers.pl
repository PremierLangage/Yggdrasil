extends = /model/basic/sortlist.pl

title = Ordre alphabétique

text ==
Classer les mots suivants dans l'ordre alphabétique.
==

before ==
sortedlist = list(range(1, 100))
==

nbitems % 5
