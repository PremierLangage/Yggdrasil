#author=OCE
#réécriture par Emmanuel Brunache

# Heritage d'un type d'exercice 
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title = Sphère

editor.code ==
from math import pi

==

text==  

Calculer le volume d'une sphère à l'aide de la formule $%V=\frac{4}{3}{\pi}R^3%$. <br>

Vous devez écrire deux fonctions:

* `cube` qui retourne le cube d'un réel et

* `volume_sphere` qui retourne le volume de la sphere 
en faisant appel à la fonction `cube`<br>

Exemple:

    >>> volume_sphere(3)
    113.09733552923254

==
before==
from math import pi

def cube(n):
    return n ** 3

def volume_sphere(r):
    return 4 / 3 * pi * cube(r)

pltest0 = """>>> cube(2)
{}
>>> cube(5)
{}
>>> cube(-7)
{}""".format(cube(2), cube(5), cube(-7))

pltest1 =""">>> volume_sphere(2)
{}
>>> volume_sphere(5)
{}
>>> volume_sphere(7)
{}
""".format( volume_sphere(2), volume_sphere(5), volume_sphere(7))
==
soluce==#|python|
from math import pi

def cube(n):
    return n ** 3

def volume_sphere(r):
    return 4 / 3 * pi * cube(r)

==











