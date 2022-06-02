

extends= /ComputerScience/python/template/pltest.pl


title= Lire la doc 

text==

Le python que vous utilisez est d'une certaine version.

Ecrivez le code qui met dans la variable VERSION le numéro de version du python qui s'exécute.
==

pltest==
>>> import sys #
>>> sys.version == VERSION # Verification 
True
==
