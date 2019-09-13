# OCE : test 11/09/2019 OK

author=DR
title= Initialisation d'une variable.
tag=variable
text==

Initialisation d'une variable.

	Intialisez la variable X avec la chaine Toto.

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


