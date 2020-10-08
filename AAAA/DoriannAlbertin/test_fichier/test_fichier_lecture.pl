author=Albertin
title= Lecture

# Fonctionne pas non plus

extends=/ComputerScience/python/template/soluce.pl
@ /utils/sandboxio.py
@ test_text.txt

before==
from random import randint
k = 1
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

mplsoluce==
test
==





