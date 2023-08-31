# OCE : test 11/09/2019 OK

# author=DR

title= Initialisation d'une variable (2).

tag=variable|affectation

text==

Initialisez la variable `X` avec la chaîne de caractères Toto.

==

editor.code==

==

# comme ca cela se passera bien
pltest==
>>> X=="Toto"
True
>>> "Toto"==X
True
>>> X !="Tata"
True
>>> X=="Toto"
True
==

pltest1==
>>> X
'Toto'
==



extends=/ComputerScience/python/template/pltest.pl



