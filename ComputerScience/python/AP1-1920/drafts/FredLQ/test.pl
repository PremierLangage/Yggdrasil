
author= Fred

# comment
extends=../../templates/pltest.pl

title = premier exo

text == 
Fonction qui retourne le reste de la division de 7 par 3 ?
{{pltest}}
==

pltest==
	>>> resteDeXpar3(3)
	0
	>>> resteDeXpar3(0)
	0
	>>> resteDeXpar3(4)
	1
==



