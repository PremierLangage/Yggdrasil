
# OCE : test 11/09/2019 OK
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = Christophe Callé

title = Initialisation de variable en Python

text=''
before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool"])
var = random.choice(["a", "b", "c", "X", "Y"])

pltest="""
>>> type({})=={}
True
""".format(var, type_var)

text="""
Initialisez la variable **{}** avec une valeur quelconque de type **{}** 
""".format(var,type_var)

==


