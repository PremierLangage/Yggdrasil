# Fonctionne pas...

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
>>> with fichier as open('fichier', 'r'):
        print(fichier.readline())
dossier
==

back==
with fichier as open(fichier.txt, 'w'):
    fichier.write(' ')
    fichier.save()

==




