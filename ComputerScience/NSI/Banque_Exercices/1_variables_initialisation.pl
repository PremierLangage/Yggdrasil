
# DR: test 24/09/2019 OK
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

tag=initialisation|variable|type

#author = CC + DR

title = Initialisation et constantes

text==
 Initialisez la variable **{{var}}** avec une valeur quelconque
 de type **{{type_var}}** 
==


editor.code ==

==

before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool"])
var = random.choice(["a", "b", "c", "X", "Y","PIERRE","feuille","ciseaux"])

pltest0="""
>>> "{}" in globals() # La variable {} est elle définie ?
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









