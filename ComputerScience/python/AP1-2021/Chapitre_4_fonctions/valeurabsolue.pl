
fextends = /ComputerScience/python/AP1-1920/templates/pltest.pl

extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
# author = Zip

title = Valeur absolue

text==
Écrivez une fonction **val_abs(x)**  qui renvoie la valeur absolue
 de son paramètre

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


