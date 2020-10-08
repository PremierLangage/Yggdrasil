
author=Albertin
title= Lecture

# Seule la randomisation plante

# old extends=/ComputerScience/python/template/prosoluce.pl
extends=/ComputerScience/python/AP1-1920/templates/prosoluce.pl
@ /utils/sandboxio.py
@ test_text.txt
@ /builder/before.py [builder.py]

before==
from random import randint
k = randint(1,6)

soluce= f"""fichier = open("test_text.txt", 'r')
lines = fichier.readlines()
print(lines[{k}-1])
fichier.close()
"""



==


text==

Ecrire un programme qui lit la {{k}}-ième ligne du fichier test_text.txt et la print.

==


plsoluce==
Le test |
==







