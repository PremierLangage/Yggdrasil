
author=ccalle
title=Creation de dictionnaire
tag=dict|variable

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

text==
Créer une variable `d` contenant un dictionnaire qui lui-même contient la valeur `5` dans la clé `"valeur"`.
==

# comme ca cela se passera bien
pltest==
>>> "valeur" in d
True
>>> d["valeur"] == 5
True
>>> len(d.keys()) == 1
True
==









