


extends=/ComputerScience/python/template/pltest.pl

title = gros templates

text==

ceic est in test de la valeur de toto
qui doit valoir 12 !!

==

pltest==
>>> toto== 12 
True
>>> toto #
12
>>> toto = 12 #
True
==

pltest1==
>>> toto != 12 
True
>>> toto #
13
>>> toto != 12 #
True
==