extends = /model/basic/radio.pl

text ==
Sélectionner le plus petit nombre de la liste suivante.
==

before ==
import random as rd
choices = sorted(rd.sample(range(50), 4))
==

