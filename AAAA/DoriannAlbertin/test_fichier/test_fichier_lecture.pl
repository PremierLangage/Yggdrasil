author=Albertin
title= Lecture

# Seule la randomisation plante

# extends=/ComputerScience/python/template/soluce.pl
extends=/ComputerScience/python/AP1-1920/templates/prosoluce.pl

@ /utils/sandboxio.py
@ test_text.txt
@ /builder/before.py [builder.py]

before==
from random import randint
soluce= presoluce.format(k=randint(1,6))
==

presoluce==
with  open("test_text.txt", 'r') as fichier:
    lines = fichier.readlines()
print(lines[{k}-1])
==

text==

Ecrire un programme qui lit la {{k}}-ième ligne du fichier "test_text.txt" et la print.


==


plsoluce==
Le test |
==







