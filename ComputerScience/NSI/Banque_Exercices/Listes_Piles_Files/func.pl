extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl

title= Distribution 

text==


Ecrire une fonction **{{funcname}}** qui vérifie le doctest suivant :

{{doctest}}


==

befor ==
from file import *
from pile import *
from liste_chainee import *
==

editor.code==
==

pltest==
>>> deal([],3)
>>> deal([(1,2),(3,4)],1)
[(1,2)],[(3,4)]
==
