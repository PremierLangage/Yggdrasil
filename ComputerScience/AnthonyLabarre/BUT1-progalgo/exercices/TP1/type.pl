extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = # adapté d'un exo de DR + CC

title = Variables et types


text==
 Initialisez la variable **{{var}}** avec une valeur quelconque
 de type **{{type_var}}** 
==



editor.height = 80

before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool"])
var = random.choice(["x", "y", "c", "X", "Y","un_deux","lapin","bob42"])

pltest0="""
>>> "{}" in globals() # La variable {} est elle d&eaccute;finie ?
True
""".format(var, var)

if type_var is None:
    pltest1="""
>>> type({}) is type(None) # La variables est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)
else:
    pltest1="""
>>> type({})=={} # La variable est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)

==





