




author= DR


title=Une fonction 

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl #template
# @ /builder/before.py [builder.py]


text==
Ecrivez une fonction f qui retourne le carré de son paramètre.
==

# Un '#' seul immédiatement après le test est invisible en cas de succès
pltest==
>>> f==f#
True
>>> f(2)#super !
4
>>> f(3)#Ceci est le test 2
9
==

pltest1==
>>> f==f#
True
>>> f(5)#super !
25
>>> from random import randint#
>>> a=randint(1,100)#
>>> f(a)==a*a
True
>>> f(3)#Ceci est le test 2
9
==

editor.code==
def f(x):
    return x*x
==
editor.height=145










