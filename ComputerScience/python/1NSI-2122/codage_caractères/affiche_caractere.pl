
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]


title= Affiche caractere 

text==


Ecrire une fonction **affiche_caractere(point_de_code)** qui affiche le caractere de point de code `point_de_code`.


==

taboo=isupper|islower

before==
def affiche_caractere(point_de_code):
    print(chr(point_de_code))

import random, sys

point_de_code = random.randint(0x4E00,0x9FFF)
pltest1=""">>> affiche_caractere({})\n{}""".format(point_de_code , chr(point_de_code ))
==


pltest0==
>>> affiche_caractere(8765)
∽
>>> affiche_caractere(0x0976)
ॶ
>>> affiche_caractere(0b1001110)
N
==


