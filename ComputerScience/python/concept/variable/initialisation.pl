extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = Christophe Callé

title = Initialisation de variable en Python

text=Initialisez la variable `{{ var }}` avec une valeur de type `{{ type_var }}` quelconque

before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool"])
var = random.choice(["a", "b", "c", "X", "Y"])

pltest="""
>>> type({})=={}
True
""".format(var, type_var)
==
