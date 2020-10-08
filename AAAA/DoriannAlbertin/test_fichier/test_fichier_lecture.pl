author=Albertin
title= Lecture

# Seule la randomisation plante

extends=/ComputerScience/python/template/soluce.pl
@ /utils/sandboxio.py
@ test_text.txt
@ /builder/before.py [builder.py]

before==
from random import randint
k = randint(1,6)

soluce= f"""
fichier = open("test_text.txt", 'r')
lines = fichier.readlines()
print(lines[{k}-1])
fichier.close()
"""



==


text==

Ecrire un programme qui lit la {{k}}-ième ligne du fichier test_text.txt et la print.

==


mplsoluce0==
test
==






