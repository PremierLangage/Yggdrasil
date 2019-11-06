author= Fred

# comment
extends=../../templates/pltest.pl
@ /builder/before.py [builder.py]

title = premier exo
taboo=import
text == 
Fonction **resteDeXpar3()** qui retourne le reste de la division de X par 3 ?

    {{pltest2}}
==

before==
from random import randint

def resteDeXpar3(n):
    return n%3

x=randint(10,20)
pltest2=">>> resteDeXpar3("+str(x)+")\n"+str(resteDeXpar3(x))+"\n"
after=before
==

pltest0==
>>> resteDeXpar3(3)
0
==

pltest1==
>>> resteDeXpar3(7)
1
>>> resteDeXpar3(4)
1
>>> resteDeXpar3(4765)
1
==


pltest3==
>>> resteDeXpar3(0)
0
>>> resteDeXpar3(4)
1
>>> resteDeXpar3(4765)
1
==



