extends = /template/radio.pl

title = Question à choix multiples (radio)

before ==
import random as rd
content=rd.sample(list(range(50)),5)
radio.loadContent([str(item) for item in content])
radio.setSolByContent(str(min(content)))
radio.shuffle()
==

text ==
Sélectionner le plus petit nombre de la liste suivante.
==
