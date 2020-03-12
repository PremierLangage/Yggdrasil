extends = /template/radio.pl

title = Plus petit nombre

before ==
import random as rd
content=rd.sample(list(range(50)),5)
radio.load_choices([str(item) for item in content])
radio.set_sol_by_content(str(min(content)))
radio.shuffle()
==

text ==
Sélectionner le plus petit nombre de la liste suivante.
==

