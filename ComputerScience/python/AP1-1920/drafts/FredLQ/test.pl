
author= Fred

# comment
extends=../../templates/pltest.pl
builder= /builder/before.py

title = premier exo
taboo=returnp
text == 
Fonction **resteDeXpar3()** qui retourne le reste de la division de 7 par 3 ?
{{pltest}}
==
before ==
import random
def resteDeXpar3(x)
    return x%3
x=random(10,20)
pltest2=""">>> resteDeXpar3({})\n {}""".format(x,resteDeXpar3(x))
after=before
==

pltest0==
	>>> resteDeXpar3(3)
	0
==

pltest1==
	>>> resteDeXpar3(0)
	0
	>>> resteDeXpar3(4)
	1
==



