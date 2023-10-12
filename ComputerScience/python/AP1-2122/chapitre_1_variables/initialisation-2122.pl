
# DR: test 24/09/2019 OK
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

tag=initialisation|variable|type

#author = CC + DR

title = Initialisation et constantes

text==

## Initialisez la variable **{{var}}** avec une valeur de votre choix mais
 de type **{{type_var}}** 





En effet en python c'est la constante avec laquelle vous initialiser une référence qui nous donne une indication de type.

Ainsi si:

    nom = "Dominique"  
    age= 120

alors
**nom** est une chaine 
**age** est un entier.
==

editor.height = 80

before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool","int","str","float","bool","int","str","float","bool",None])
var = random.choice(["a", "b", "c", "X", "Y","PIERRE","feuille","ciseaux", "Eiffel","Gustave","univ_eiffel_fr"])

pltest0="""
>>> "{}" in globals() # La variable {} est elle d&eacute;finie ?
True
""".format(var, var)

if type_var is None:
    pltest1="""
>>> type({}) is type(None) # La variable est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)
else:
    pltest1="""
>>> type({})=={} # La variable est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)

==









