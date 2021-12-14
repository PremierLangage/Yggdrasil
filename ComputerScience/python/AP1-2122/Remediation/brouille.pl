





author= DR
title= Perte en ligne  


tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

La ligne de communication est très brouillé et beaucoup de caractères sont changés.
Mais comme nous pouvons recevoir beaucoup de fois le message. 
Nous nous proposons d'envoyer beaucoup de fois le message puis de chercher pour chaque position quelle
 est la lettre la plus fréquente, et de fabriquer le mot construit avec ces lettres.

Ecrire une fonction **Oeufbrouile** qui prend une liste de chaines et retourne la chaine construite avec les lettres les plus fréquentes à chaque position.

Exemple:
Oeufbrouile(["bat","tot","bol"])
retourne 'bot'

==

@ fileread.py 



pltest==
>>> import fileread #
>>> Oeufbrouile(fileread.produce("bonjour")) == "bonjour" # Gros test
True
==



@ /ComputerScience/python/AP1-2122/Remediation/triangles.txt