extends=/ComputerScience/python/template/pltest.pl

title = Initialisation d'une variable


text ==
Initialisez la variable `X` avec la chaîne `toto`.
==

# comme ca cela se passera bien
pltest ==
>>> X==X # Initialisation d'une variable X
True
>>> "Toto"==X
True
==