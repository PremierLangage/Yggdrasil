extends = /model/basic/radio.pl

title = Trouver le plus petit nombre

text ==
Sélectionner le plus petit nombre de la liste suivante.
==

before ==
items = sorted(sample(range(50), 4))
==