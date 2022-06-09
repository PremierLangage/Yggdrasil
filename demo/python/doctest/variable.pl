extends=/ComputerScience/python/template/pltest.pl

title = Initialisation d'une variable


text ==
Initialiser la variable `X` avec la chaîne `toto`.
==

pltest ==
>>> "X" in globals() # Initialisation d'une variable X
True
>>> X == "toto"
True
==