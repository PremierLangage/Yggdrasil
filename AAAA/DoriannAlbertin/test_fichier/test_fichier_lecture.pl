author=Albertin
title= Lecture

# Seule la randomisation plante

# extends=/ComputerScience/python/template/soluce.pl
extends=/ComputerScience/python/AP1-1920/templates/prosoluce.pl


tag=open|with|readlines|file

@ /utils/sandboxio.py
@ test_text.txt
@ /builder/before.py [builder.py]

before==
from random import randint
k=randint(1,6)
soluce= presoluce
==

back==
fichier_moche_pour_le_type = open("test_text.txt", 'r')
fichier_moche_pour_le_type.close()
i = None
for i in globals():
    if type(eval(i)) == type(fichier_moche_pour_le_type) and not eval(i).closed:
            print("Merci de fermer les fichiers !")

==

presoluce==
with  open("test_text.txt", 'r') as fichier:
    lines = fichier.readlines()
print(lines[1])
==

text==
Ecrire un programme qui lit la **{{k}}-ième** ligne du fichier "test_text.txt" et la print.

==


plsoluce==
Le test |
==










