extends = /model/basic/radio.pl

title = Trouver le plus petit nombre

question ==
Sélectionner le plus petit nombre de la liste suivante.
==

before ==
items = [str(x) for x in sorted(sample(range(50), 4))]
==