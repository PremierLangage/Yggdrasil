# Work in progress

author=Albertin
title= Ecrire - ouvrir

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py
@ fichier.txt




text==

Créer un fichier `fichier.txt` avec une ligne `dossier`.<br/>
Fermer le fichier.

==


pltest==
>>> with open('fichier.txt', 'r') as fichier:
        print(fichier.readline())
dossier
==

back==
with open(fichier.txt, 'w') as fichier:
    fichier.write(' ')
    fichier.save()

==




