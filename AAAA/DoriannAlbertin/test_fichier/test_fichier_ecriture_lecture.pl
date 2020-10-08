# Fonctionne pas...

author=Albertin
title= Ecrire - ouvrir

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py




text==

Créer un fichier `texte.txt` avec une ligne `peut on ecrire des fichiers sur une feuille pl ?`.<br/>
Fermer le fichier.<br/>
Ouvrir le fichier et print son contenu.

==

soluce==
fichier = open("texte.txt", 'w')
fichier.write("peut on ecrire des fichiers sur une feuille pl ?")
fichier.close()
fichier = open("texte.txt", 'r')
line = fichier.readline()
print(line)
fichier.close()
==

pltest==

==


