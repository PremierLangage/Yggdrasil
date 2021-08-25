# OCE : test 11/09/2019 OK

# author=DR

title= Initialisation d'une variable (2).

tag=variable|affectation

text==

Initialisation d'une variable.

	Initialisez la variable X avec la chaîne Toto.

==

code==

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



