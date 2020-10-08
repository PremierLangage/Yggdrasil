author=Albertin
title= Lecture

# Fonctionne pas non plus

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

before==
from random import randint
k = randint(1,6)
==


text==

Ecrire un programme qui lit la {{k}}-ième ligne du fichier test_text.txt et la print.

==

soluce==
fichier = open("test_text.txt", 'r')
lines = fichier.readlines()
print(lines[k-1])
fichier.close()
==

pltest==
==





