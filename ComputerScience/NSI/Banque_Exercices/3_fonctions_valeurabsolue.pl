

extends = /ComputerScience/python/template/pltest.pl
# author = Zip
tag=function
title = Valeur absolue

text==
Écrivez une fonction `val_abs`  qui renvoie la [valeur absolue](https://fr.wikipedia.org/wiki/Valeur_absolue#D%C3%A9finition) de son paramètre

Exemples :

	>>> val_abs(5)
    5
    >>> val_abs(-5)
    5
==

editor.code==


==

pltest==

>>> val_abs(-44)
44
==


pltest1==
>>> val_abs(4) == 4
True
==

Xeditor.code==
def val_abs(x):
    if x<0:
        x=-x # Fixme pourquoi j'aime pas cette solution car si le type de x est un peu plus compliqué on a changé sa valeur 
        # en faisant un effet de bord return -x c'est mieux non ?
    return x
==


