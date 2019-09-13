#author = Olivier Champalle

extends=/ComputerScience/python/template/qcm_template.pl

title=Nommage de variable

text=Parmi les variables suivantes, sélectionnez celle qui ont des noms valides

mybuild==
import random
random.seed(seed)
nbtrues = random.randint(2,3)
==

nb=4
uncrosedfalse=
good==
bonjour
oui
Ciao
NON
byeBye7
_upem_
good_morning
==

bad==
au revoir
Hi!
def
6hello6
good-afternoon
==

feedback=show


